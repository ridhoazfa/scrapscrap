#!/usr/bin/env bash
# ============================================================
#  ScrapScrap — Terminal Quickstart Launcher (macOS / Linux)
# ============================================================

set -e
cd "$(dirname "$0")"

echo "============================================================"
echo "  ScrapScrap - Local Google Maps & Email Harvester"
echo "============================================================"
echo ""
echo "  [1] Open Lead Studio Web Interface (http://localhost:3800)"
echo "  [2] Run Custom Scrape (City & Niche)"
echo "  [3] Verify Email Deliverability (5-Layer MX Check)"
echo "  [4] Export All Leads to CSV"
echo "  [5] Exit"
echo ""
read -p "Select an option [1-5]: " opt

case "$opt" in
  1)
    echo "Launching Lead Studio Web Interface on port 3800..."
    if command -v xdg-open > /dev/null; then
      xdg-open "http://localhost:3800" &
    elif command -v open > /dev/null; then
      open "http://localhost:3800" &
    fi
    node src/ui/server.js
    ;;
  2)
    read -p "Enter Country (e.g. united-states, indonesia, uk): " cc
    read -p "Enter City (e.g. Austin, London, Jakarta): " ci
    read -p "Enter Niche (e.g. Gym, Dental Clinic): " ni
    read -p "Minimum Rating [default 4.0]: " mr
    mr=${mr:-4.0}
    read -p "Minimum Reviews [default 100]: " mv
    mv=${mv:-100}
    echo "Starting scraper for $ci ($ni)..."
    node src/cli.js --country "$cc" --cities "$ci" --niche "$ni" --min-rating "$mr" --min-reviews "$mv"
    ;;
  3)
    read -p "Enter email address to verify: " em
    node src/cli.js --verify "$em"
    ;;
  4)
    node src/cli.js --export "leads-export.csv"
    ;;
  5)
    exit 0
    ;;
  *)
    echo "Invalid option."
    exit 1
    ;;
esac
