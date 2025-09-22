#!/usr/bin/env nix-shell
#! nix-shell -i python3 -p python3Packages.google-search-results

from serpapi import GoogleSearch
import json
import os


API_KEY = os.getenv("SERPAPI_KEY")
QUERY = '"PX4" gnss-denied'
RESULTS_PER_PAGE = 20  # Google Scholar limit
MAX_QUERIES = 20
LIMIT_ENABLED = True

START = 0
page_count = 0
all_results = []

while True:
    if LIMIT_ENABLED and page_count >= MAX_QUERIES:
        break

    params = {
        "engine": "google_scholar",
        "q": QUERY,
        "api_key": API_KEY,
        "num": str(RESULTS_PER_PAGE),
        "start": str(START)
    }

    search = GoogleSearch(params)
    results = search.get_dict()
    organic_results = results.get("organic_results", [])

    if not organic_results:
        break

    all_results.extend(organic_results)
    START += RESULTS_PER_PAGE
    page_count += 1




OUTPUT_FILE="literature_search.json"
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(all_results, f, ensure_ascii=False, indent=2)

print(f"Saved {len(all_results)} papers to px4_gnss_denied_raw.json (fetched {page_count} pages)")
print(f"Try running `jq -r '.[] | [.title, .link, .result_id] | @csv' {OUTPUT_FILE}")
