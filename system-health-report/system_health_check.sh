#!/bin/bash

# Author: Bablu Alam
# Description: Automated System Health Check Script (Daily Summary Report)
# OS Support: CentOS / RHEL / Ubuntu (with some YUM/APT logic)

LOGFILE="/var/log/system_health_$(date +%F).log"
EMAIL="your_email@example.com"  # Optional: Set to send reports

echo "System Health Report - $(date)" > "$LOGFILE"
echo "===============================" >> "$LOGFILE"

# Uptime
echo -e "\n🔹 Uptime:" >> "$LOGFILE"
uptime >> "$LOGFILE"

# CPU Load
echo -e "\n🔹 CPU Load:" >> "$LOGFILE"
top -bn1 | grep "load average" >> "$LOGFILE"

# Memory Usage
echo -e "\n🔹 Memory Usage:" >> "$LOGFILE"
free -m >> "$LOGFILE"

# Disk Usage
echo -e "\n🔹 Disk Usage:" >> "$LOGFILE"
df -h >> "$LOGFILE"

# Logged-in Users
echo -e "\n🔹 Logged-in Users:" >> "$LOGFILE"
who >> "$LOGFILE"

# Top Processes
echo -e "\n🔹 Top 5 Memory Consuming Processes:" >> "$LOGFILE"
ps aux --sort=-%mem | head -n 6 >> "$LOGFILE"

# Running Services
echo -e "\n🔹 Top Running Services:" >> "$LOGFILE"
systemctl list-units --type=service --state=running | head -n 10 >> "$LOGFILE"

# Check for Pending Security Updates (YUM or APT based)
if command -v yum &> /dev/null; then
    echo -e "\n🔹 Pending YUM Security Updates:" >> "$LOGFILE"
    yum check-update --security >> "$LOGFILE" 2>/dev/null
elif command -v apt &> /dev/null; then
    echo -e "\n🔹 Pending APT Updates:" >> "$LOGFILE"
    apt list --upgradable 2>/dev/null | grep -i security >> "$LOGFILE"
fi

echo -e "\n✅ Report Generated at: $(date)" >> "$LOGFILE"

# Optional Email (Uncomment if mail setup exists)
# cat "$LOGFILE" | mail -s "Daily System Health Report" "$EMAIL"
