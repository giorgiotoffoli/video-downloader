#!/bin/bash

read -p "Video URL: " url

format = ""

PS3="Select format: "
options=(".mp4 (video)" ".mp3 (audio)")

select opt in "${options[@]}"; do
    case $opt in
        ".mp4 (video)")
            format="mp4"
            break
            ;;
        ".mp3 (audio)")
             format="mp3"
             break
             ;;
        *)
            echo "Invalid option $REPLY"
            ;;
    esac
done

if [format == "mp3"]
then
    yt-dlp -x --audio-format mp3 -P "$HOME/YouTube/SFX" "$url"
else
yt-dlp -f "bv*+ba/b" --merge-output-format mp4 -P "$HOME/YouTube/VFX" "$url"
fi
