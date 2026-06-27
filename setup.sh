#!/bin/bash

# Update package list and install Python 3.12 venv and system dependencies
sudo apt update && sudo apt install -y \
    python3.12-venv \
    build-essential \
    python3-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libwebp-dev \
    tcl8.6-dev tk8.6-dev \
    libharfbuzz-dev \
    libfribidi-dev

# Setup Virtual Environment
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3.12 -m venv venv
fi

# Activate Virtual Environment
source venv/bin/activate

# Upgrade pip and build tools
python3 -m pip install --upgrade pip setuptools wheel

# Purge pip cache
pip cache purge

# Install Pillow and specific uvloop version
pip install Pillow
pip uninstall -y uvloop
pip install uvloop==0.19.0

# Install remaining dependencies from requirements.txt
pip install -r requirements.txt

echo "Installation complete."
echo "Now run configuration: bash set.sh"
