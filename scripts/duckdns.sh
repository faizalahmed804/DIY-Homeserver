#!/bin/bash

# DuckDNS update script
# Creates ~/duckdns directory, sets up script, and cron job

# Variables (replace with your actual domain and token)
DOMAIN="yourdomain"
TOKEN="yourtoken"
DUCKDNS_DIR="$HOME/duckdns"
SCRIPT="$DUCKDNS_DIR/duck.sh"
LOGFILE="$DUCKDNS_DIR/duck.log"

# Create directory if it doesn't exist
mkdir -p "$DUCKDNS_DIR"

# Write the update script
cat > "$SCRIPT" <<EOF
#!/bin/bash
echo url="https://www.duckdns.org/update?domains=${DOMAIN}&token=${TOKEN}&ip=" \\
| curl -k -o ${LOGFILE} -K -
EOF

# Make it executable
chmod 700 "$SCRIPT"

# Add cron job (every 5 minutes)
# This will append to your crontab if not already present
CRON_ENTRY="*/5 * * * * $SCRIPT >/dev/null 2>&1"
( crontab -l 2>/dev/null | grep -F "$SCRIPT" || echo "$CRON_ENTRY" ) | crontab -
