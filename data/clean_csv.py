import os

folder_path = "./instacart-project/data"

for filename in os.listdir(folder_path):
    if filename.endswith(".csv"):
        file_path = os.path.join(folder_path, filename)
        print(f"Clean {filename}...")

        with open(file_path, "rb") as f:
            raw = f.read()
        # Forced decode ignoring invalid byte
        cleaned = raw.decode("windows-1252", errors="ignore")
        # Remove invisible characters
        cleaned = ''.join(ch for ch in cleaned if ch.isprintable() or ch in '\n\r,;')
        # Delete empty rows or with too many columns
        lines = [line for line in cleaned.splitlines() if line.count(',') >= 3]
        cleaned = '\n'.join(lines)
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(cleaned)
        print(f"File cleaned and saved in UTF-8: {filename}")

print("All CSV files are cleaned and converted successfully")