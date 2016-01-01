#!/bin/bash
# Edit this to set the timezone for your country 
M_TIMEZONE=Europe/Berlin

# -----------------------------------------------------------------------------
#	Set timezone in non-interactive mode
# -----------------------------------------------------------------------------
echo "Configuring timezone..."
echo "$M_TIMEZONE" | tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Contact NTP server
ntpdate -u ntp.ubuntu.com