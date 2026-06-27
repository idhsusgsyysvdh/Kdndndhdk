import os
import re

def check_files():
    directory = r"d:\userbot-main\PyroUbot\modules"
    pattern = re.compile(r"@PY\.UBOT\((.*?)\)", re.DOTALL)
    
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".py"):
                path = os.path.join(root, file)
                try:
                    with open(path, "r", encoding="utf-8") as f:
                        content = f.read()
                        matches = pattern.findall(content)
                        for match in matches:
                            args = match.strip()
                            # Check if the first argument starts with a quote
                            if not (args.startswith('"') or args.startswith("'")):
                                print(f"Suspicious usage in {path}: @PY.UBOT({args})")
                except Exception as e:
                    print(f"Error reading {path}: {e}")

if __name__ == "__main__":
    check_files()
