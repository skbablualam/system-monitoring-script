# system-monitoring-script
Built a Bash automation framework for daily system health monitoring and reporting, reducing manual check overhead by 90% and improving system visibility.

# System Health Report - Bash Script

A Bash-based automation script to generate daily system health reports for Linux servers. Ideal for system administrators, DevOps engineers, and anyone managing Linux infrastructure.

## ✅ Features
- Uptime & load average
- CPU & memory usage
- Disk utilization
- Logged-in users
- Top memory-consuming processes
- Running services
- Security updates (YUM/APT)
- Logs saved daily with timestamps
- Cron-compatible

## 🛠️ How to Use

1. Clone this repo:
   ```bash
   git clone https://github.com/skbablualam/system-health-report.git
   cd system-health-report
   
## Make the script executable:
chmod +x system_health_check.sh

## Run manually:
./system_health_check.sh

## Or add to cron for daily execution:
crontab -e

0 7 * * * /absolute/path/system_health_check.sh

## 📥 Output
Reports are saved in /var/log/system_health_<date>.log.

## 📧 Optional
Integrate with email or log server as needed.
