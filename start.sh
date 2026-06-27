#!/bin/bash

# Activate Virtual Environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

echo "Installing/Updating dependencies..."
python3 -m pip install -r requirements.txt

echo "Starting Userbot..."
python3 -m PyroUbot