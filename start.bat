@echo off
TITLE SherifNet Userbot
echo Checking dependencies...

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo Failed to install dependencies!
    pause
    exit /b %errorlevel%
)

echo Starting Userbot...
python -m PyroUbot
pause