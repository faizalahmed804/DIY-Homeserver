#!/bin/bash

# --- Script to configure Uncomplicated Firewall (UFW) rules ---

# Check if the script is run with root privileges (sudo)
if [ "$EUID" -ne 0 ]; then
  echo "🚨 Please run this script with sudo: sudo ./configure_ufw.sh"
  exit 1
fi

echo "Starting UFW configuration..."
echo "---"

# 1. Allow incoming traffic on port 80 (HTTP)
echo "Setting UFW rule: Allow incoming on port 80 (HTTP)..."
ufw allow 80

# Check the exit status of the previous command
if [ $? -eq 0 ]; then
    echo "✅ Rule for port 80 added successfully."
else
    echo "❌ Error adding rule for port 80. Aborting."
    exit 1
fi

# 2. Allow incoming traffic on port 443 (HTTPS)
echo "Setting UFW rule: Allow incoming on port 443 (HTTPS)..."
ufw allow 443

if [ $? -eq 0 ]; then
    echo "✅ Rule for port 443 added successfully."
else
    echo "❌ Error adding rule for port 443. Aborting."
    exit 1
fi

# 3. Enable UFW
echo "Enabling UFW. This may interrupt existing connections..."
# The --force flag is used to suppress the interactive 'Proceed with operation (y|n)?' prompt.
ufw --force enable

if [ $? -eq 0 ]; then
    echo "---"
    echo "🎉 UFW has been enabled and configured!"
    echo "Current UFW Status:"
    ufw status verbose
else
    echo "---"
    echo "❌ Error enabling UFW."
    exit 1
fi
