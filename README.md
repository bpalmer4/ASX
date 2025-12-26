# ASX Rate Tracker

Automated daily capture and analysis of ASX interest rate futures data, tracking market expectations for RBA cash rate movements.

## Overview

This project scrapes ASX 30-day Interbank Cash Rate Futures data to calculate market-implied RBA cash rate expectations. It captures daily snapshots, aggregates historical data, and generates analytical charts comparing market forecasts against actual RBA policy decisions.

Data collection has been running since April 2022, with over 1,000 daily snapshots captured.

## Project Structure

```
ASX/
├── asx_daily_data_capture.py    # Main data capture script
├── ASX-daily-capture.sh         # Daily automation shell script
├── ASX-rate-tracker-reporting.ipynb  # Analysis and visualization notebook
├── pyproject.toml               # Python project configuration
├── uv.lock                      # Dependency lock file
├── ASX_DAILY_DATA/              # Daily captured CSV files
├── ASX-COMBINED/                # Aggregated master dataset
└── CHARTS/                      # Generated visualization outputs
```

## Key Components

### Data Capture (`asx_daily_data_capture.py`)
Fetches futures contract data from the ASX API and calculates implied cash rates from settlement prices. Saves daily snapshots as CSV files with format `scraped_cash_rate_YYYY-MM-DD.csv`.

### Analysis Notebook (`ASX-rate-tracker-reporting.ipynb`)
Aggregates all daily CSVs, performs data cleaning (removes anomalies, excludes weekends), and generates analytical charts. Integrates with RBA official cash rate data via the `readabs` library.

### Automation (`ASX-daily-capture.sh`)
Shell script that orchestrates daily execution:
1. Runs data capture script
2. Executes the reporting notebook
3. Commits changes to git

Scheduled via crontab to run at 20:01 on weekdays.

## Data Directories

| Directory | Contents |
|-----------|----------|
| `ASX_DAILY_DATA/` | Daily CSV snapshots (1,000+ files from April 2022 onwards) |
| `ASX-COMBINED/` | Master consolidated CSV combining all daily data |
| `CHARTS/` | Generated PNG visualizations |

## Generated Charts

1. **Data capture by month** - Data collection completeness
2. **Market anticipated RBA policy rates** - Main multi-line forecast chart
3. **End-of-month rates (from 2022-04)** - Full historical view
4. **End-of-month rates (from 2024-12)** - Recent data focus
5. **18-month endpoint forecast vs RBA cash rate** - Forecast accuracy
6. **Next fully anticipated rate cut** - When market expects next cut
7. **Next fully anticipated rate hike** - When market expects next hike

## Dependencies

- Python 3.14
- pandas, numpy, matplotlib, seaborn
- requests (HTTP client)
- readabs (RBA data access)
- mgplot (custom plotting)
- Jupyter/IPython

Managed with [uv](https://github.com/astral-sh/uv) package manager.

## Setup

```bash
# Create virtual environment and install dependencies
uv sync

# Activate virtual environment
source .venv/bin/activate
```

## Usage

### Manual execution
```bash
# Run data capture only
python asx_daily_data_capture.py

# Run full pipeline (capture + analysis + git commit)
./ASX-daily-capture.sh
```

### Automated execution
Add to crontab for daily runs:
```
01 20 * * 1-5 /path/to/ASX-daily-capture.sh
```

## Data Sources

- **ASX Futures Data**: [ASX Interest Rate Futures API](https://asx.api.markitdigital.com/asx-research/1.0/derivatives/interest-rate/IB/futures)
- **RBA Cash Rate**: Via [readabs](https://github.com/MattCowgill/readabs) library

## Attribution

Based on [Matt Cowgill's cash-rate-scraper](https://github.com/MattCowgill/cash-rate-scraper). Historical data (pre-April 2022) sourced from that project.
