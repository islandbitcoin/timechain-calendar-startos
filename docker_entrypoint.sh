#!/bin/bash

set -a

# Display current installed version and help
echo "Timechain Calendar v0.3.46"
echo "Starting Server..."
echo "Getting mempool url..."

REACT_APP_MEMPOOL_WEBSOCKET_URL="wss://$(/usr/bin/yq e '.lan-address' /root/data/start9/config.yaml)/api/v1/ws"

echo "Mempool Space Websocket URL: $REACT_APP_MEMPOOL_WEBSOCKET_URL"

sed -i "s|<body|<body data-mempool-url\=\"$REACT_APP_MEMPOOL_WEBSOCKET_URL\"|g" /app/index.html

# Start the apache web server
echo "Starting Apache Web Server..."
/usr/sbin/httpd -D FOREGROUND
