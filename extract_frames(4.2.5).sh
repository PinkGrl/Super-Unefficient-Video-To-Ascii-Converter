#!/bin/bash

# Check if a video file was specified as a command line argument
if [ -z "$1" ]; then
    echo "Please specify a video file as a command line argument."
    exit 1
fi

input_video="$1"

# Create a temporary directory to store the jpg images
tmpdir=$(mktemp -d)

# Extract every 2nd frame from the input video and save them as jpg images in the temporary directory
ffmpeg -i "$input_video" -vf "select=not(mod(n\,3))" -vsync vfr -q:v 2 "$tmpdir/%08d.jpg"
cd "$tmpdir"
ls -1tr *.jpg > files.txt
ffmpeg -f concat -safe 0 -i files.txt -vsync vfr -pix_fmt yuv420p output.mp4

# Extract audio from input video and save it as an mp3 file
ffmpeg -i "$input_video" -vn -acodec libmp3lame output.mp3

# Create a named pipe for synchronization
mkfifo mypipe

# Play extracted audio using mpv when it receives a message through the named pipe
mpv output.mp3 < mypipe &

# Send a message through the named pipe to start audio playback
echo "start" > mypipe

# Play extracted jpg images at 20fps using jp2a inside terminal
for img in "$tmpdir"/*.jpg; do
    clear
    jp2a --color "$img"
    sleep 0.05
done

# Remove temporary directory and its contents
rm -rf "$tmpdir"

# Remove named pipe
rm mypipe
