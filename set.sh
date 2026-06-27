#!/bin/bash

# Clear screen
clear

echo "========================================="
echo "   SherifNet Userbot Auto Configuration"
echo "========================================="
echo ""
echo "Silahkan masukkan data yang diperlukan."
echo "Tekan Enter jika ingin menggunakan value default (jika ada)."
echo ""

# Function to prompt for input
prompt_input() {
    local prompt_text="$1"
    local var_name="$2"
    local default_val="$3"
    
    if [ -n "$default_val" ]; then
        read -p "$prompt_text [$default_val]: " input_val
        if [ -z "$input_val" ]; then
            eval $var_name=\"$default_val\"
        else
            eval $var_name=\"$input_val\"
        fi
    else
        while [ -z "$input_val" ]; do
            read -p "$prompt_text: " input_val
        done
        eval $var_name=\"$input_val\"
    fi
}

# Prompt for variables
prompt_input "Masukkan API_ID (dari my.telegram.org)" API_ID
prompt_input "Masukkan API_HASH (dari my.telegram.org)" API_HASH
prompt_input "Masukkan BOT_TOKEN (dari @BotFather)" BOT_TOKEN
prompt_input "Masukkan OWNER_ID (ID Telegram Anda)" OWNER_ID
prompt_input "Masukkan MONGO_URL (Database MongoDB)" MONGO_URL

echo ""
echo "--- Konfigurasi Tambahan (Opsional) ---"
read -p "Masukkan LOGS_MAKER_UBOT (Default: -1003192483568): " LOGS_MAKER_UBOT
if [ -z "$LOGS_MAKER_UBOT" ]; then
    LOGS_MAKER_UBOT="-1003192483568"
fi

read -p "Masukkan RMBG_API (API Key Remove.bg, Opsional): " RMBG_API

# Generate .env file
echo ""
echo "Sedang membuat file .env..."

cat <<EOF > .env
API_ID=$API_ID
API_HASH=$API_HASH
BOT_TOKEN=$BOT_TOKEN
OWNER_ID=$OWNER_ID
MONGO_URL=$MONGO_URL
LOGS_MAKER_UBOT=$LOGS_MAKER_UBOT
MAX_BOT=200
DEVS=$OWNER_ID
BLACKLIST_CHAT=-
RMBG_API=$RMBG_API
PAKASIR_PROJECT=sherifnet
PAKASIR_API_KEY=
EOF

echo ""
echo "========================================="
echo "   Konfigurasi Selesai!"
echo "   File .env telah berhasil dibuat."
echo "   Jalankan bot dengan: bash start.sh"
echo "========================================="
