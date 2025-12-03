#!/bin/zsh
# crontab: 01 20 * * 1-5 /Users/bryanpalmer/ASX/ASX-daily-capture.sh
# note: * * * * * ==> minute hour day-of-month month day-of-week

# set-up parameters
home=/Users/bryanpalmer
project=ASX

# move to the project directory
cd $home/$project

# activate the uv environment
source $home/$project/.venv/bin/activate

# capture the daily ASX data
python ./asx_daily_data_capture.py >>./LOGS/asx-log.log 2>>./LOGS/asx-err.log

# generate the charts
ipython ./ASX-rate-tracker-reporting.ipynb >>./LOGS/asx-log.log 2>>./LOGS/asx-err.log

# upload to git (uncomment when git is set up)
# git add -A
# git commit -m "Daily ASX data capture $(date +%Y-%m-%d)"
# git push

