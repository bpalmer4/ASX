# ASX Rate Tracker

Automated daily capture and analysis of ASX interest rate futures data, tracking market expectations for RBA cash rate movements.

The `asx_daily_data_capture.py` script scrapes futures contract data from the ASX API and saves daily snapshots to `ASX_DAILY_DATA/`. The Jupyter notebook `ASX-rate-tracker-reporting.ipynb` aggregates this data and generates charts comparing market-anticipated rate paths against the actual RBA Official Cash Rate.

Data collection runs daily via `ASX-daily-capture.sh`, with historical data dating back to April 2022. Historical data (pre-April 2022) sourced from [Matt Cowgill's cash-rate-scraper](https://github.com/MattCowgill/cash-rate-scraper).
