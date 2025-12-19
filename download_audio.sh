#!/bin/bash

# Check if a filename was provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <links_file.txt>"
    exit 1
fi

INPUT_FILE=$1

# Check if the file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File '$INPUT_FILE' not found."
    exit 1
fi

# Loop through each line in the file
while IFS= read -r url || [ -n "$url" ]; do
    # Skip empty lines or lines starting with #
    [[ -z "$url" || "$url" =~ ^# ]] && continue

    echo "Processing: $url"

    # Execute yt-dlp
    # -x: Extract audio
    # --audio-format mp3: Convert to mp3
    # --audio-quality 256k: Set bitrate
    # -o: Output template (Title.mp3)
    yt-dlp -x --audio-format mp3 --audio-quality 256k -o "%(title)s.%(ext)s" "$url"

done < "$INPUT_FILE"

echo "All downloads complete!"
