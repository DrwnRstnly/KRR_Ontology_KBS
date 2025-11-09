import json
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from bs4 import BeautifulSoup

def setup_driver():
    opts = Options()
    # opts.add_argument("--headless")  # Uncomment for faster, invisible scraping
    opts.add_argument("--no-sandbox")
    opts.add_argument("--disable-dev-shm-usage")
    # Use a realistic user agent
    opts.add_argument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36")
    # Block some ads/trackers to speed up loading
    opts.add_experimental_option("prefs", {"profile.managed_default_content_settings.images": 2}) 
    
    return webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)

def attempt_close_popups(driver):
    """Attempts to close common overlays/interstitials."""
    try:
        # Standard Google interstitial dismiss button
        dismiss = WebDriverWait(driver, 2).until(
            EC.element_to_be_clickable((By.ID, "dismiss-button"))
        )
        dismiss.click()
        print("✅ Popup closed.")
    except Exception:
        # Sometimes it's in an iframe, or doesn't exist. Ignore if not found.
        pass

def main():
    driver = setup_driver()
    base_url = "https://www.deckshop.pro"
    
    try:
        print("📡 Loading arenas page...")
        driver.get(f"{base_url}/card/by-arena")
        
        # Wait for the main content to load
        WebDriverWait(driver, 15).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "section[id^=arena]"))
        )
        
        # Phase 1: Collect all links first (much faster and safer than navigating back and forth)
        print("🔍 Collecting card links...")
        soup_main = BeautifulSoup(driver.page_source, "html.parser")
        arenas_map = {} # Use a dict to organize data by arena temporarily
        
        total_cards = 0
        for section in soup_main.select("section[id^=arena]"):
            arena_header = section.select_one("h4")
            if not arena_header: continue
                
            arena_name = arena_header.get_text(strip=True)
            arenas_map[arena_name] = []
            
            for link_tag in section.select("a[href^='/card/detail/']"):
                card_img = link_tag.select_one("img.card")
                if card_img and link_tag.get('href'):
                    card_name = card_img.get("alt", "Unknown Card")
                    full_link = base_url + link_tag['href']
                    arenas_map[arena_name].append({
                        "name": card_name,
                        "link": full_link,
                        "stats": {} # Placeholder
                    })
                    total_cards += 1
        
        print(f"📋 Found {total_cards} cards across {len(arenas_map)} arenas. Starting detailed scrape...")

        # Phase 2: Visit each card and scrape details
        count = 0
        for arena_name, cards in arenas_map.items():
            print(f"\n--- Processing Arena: {arena_name} ---")
            for card in cards:
                count += 1
                print(f"[{count}/{total_cards}] Scraping {card['name']}...")
                
                try:
                    driver.get(card['link'])
                    
                    # Wait for the stats table to be present
                    try:
                        WebDriverWait(driver, 10).until(
                            EC.presence_of_element_located((By.TAG_NAME, "table"))
                        )
                    except:
                        print(f"⚠️ Timeout waiting for table on {card['name']}, possibly no stats.")

                    attempt_close_popups(driver)

                    # Parse details
                    detail_soup = BeautifulSoup(driver.page_source, "html.parser")
                    stats = {}
                    
                    # Target the main stats table specifically if possible, or all tables
                    for table in detail_soup.select("table"):
                        for row in table.select("tr"):
                            th = row.select_one("th")
                            td = row.select_one("td")
                            if th and td:
                                key = th.get_text(strip=True)
                                val = td.get_text(strip=True)
                                # Basic cleaning to avoid empty keys
                                if key:
                                    stats[key] = val
                    
                    card['stats'] = stats
                    # Small sleep to be polite to the server
                    time.sleep(0.5)

                except Exception as e:
                    print(f"❌ Error scraping {card['name']}: {e}")

        # Reformat for final output as requested by original structure
        final_output = [{"arena": k, "cards": v} for k, v in arenas_map.items()]

        with open("deckshop_cards.json", "w", encoding="utf-8") as f:
            json.dump(final_output, f, ensure_ascii=False, indent=2)
        print("\n✅ Success! Saved to deckshop_cards.json")

    finally:
        driver.quit()

if __name__ == "__main__":
    main()