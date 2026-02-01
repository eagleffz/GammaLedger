#!/bin/sh

# Default config.js
cat <<EOF > /usr/share/nginx/html/config.js
window.APP_ENV = {
    FINNHUB_API_KEY: "${FINNHUB_API_KEY:-}",
    FINNHUB_RATE_LIMIT: "${FINNHUB_RATE_LIMIT:-}",

    DEFAULT_FEE_PER_CONTRACT: "${DEFAULT_FEE_PER_CONTRACT:-}"
};
EOF
