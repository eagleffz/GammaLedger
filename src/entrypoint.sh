#!/bin/sh

# Default config.js
cat <<EOF > /usr/share/nginx/html/config.js
window.APP_ENV = {
    FINNHUB_API_KEY: "${FINNHUB_API_KEY:-}",
    FINNHUB_RATE_LIMIT: "${FINNHUB_RATE_LIMIT:-}",
    GEMINI_API_KEY: "${GEMINI_API_KEY:-}",
    GEMINI_MODEL: "${GEMINI_MODEL:-}",
    GEMINI_MAX_TOKENS: "${GEMINI_MAX_TOKENS:-}",
    DEFAULT_FEE_PER_CONTRACT: "${DEFAULT_FEE_PER_CONTRACT:-}"
};
EOF
