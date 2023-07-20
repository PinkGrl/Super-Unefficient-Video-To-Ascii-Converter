# Super-Unefficient-Video-To-Ascii-Converter
I made a video to ASCII converter (With help from Bing AI) for the Terminal that can work on my Mac. It is not very optimised.

## How It Works
The principles behind how the scripts work are stupidly simple.

- Turn a significant amount of the frames into jpg images (The exact number should be in the code... somewhere)

- Use ``jpg2ascii`` to turn the jpg frames into ASCII text

- Play the new ASCII frames in the terminal

## Problems

- This method has worked okay for me so far, but when used on other devices, it falls apart.

- Because of the way the video is played back, audio becomes kinda impossible to use (unless sb else has a solution?)

- The frames aren't played back at the right speed. My best attempts got _close_ but not close enough.

# Instructions
Okay, if ur still convinced that this is worth your time, here's how to use everything (theoretically)

1. extract_frames(4.2)
- This is the file used to turn **locally** stored video into **black and white** ASCII video. Type: ``./extract_frames\(4.2\).sh sample.mp4`` to run the file with your desired `mp4` video   

2. extract_frames(4.2.5)
- This is the file used to turn **locally** stored video into **coloured** ASCII video. Type: ``/extract_frames\(4.2\).sh sample.mp4 `` to run the file with your desired `mp4` video

3. extract_frames(4.3)
- Now _this_ is where it gets interesting!

- This is the file used to turn **YouTube links** into **black and white** video and then into ASCII using `youtube-dl`! Type: ``/extract_frames\(4.3\).sh sample.mp4`` (note that it does **not** work with YT shorts)

4. extract_frames(4.3.5)
- This is the file used to turn **YouTube links** into **colored** video and then into ASCII using `youtube-dl`! Type: ``/extract_frames\(4.3.5\).sh sample.mp4``

If you have any improvements you think you can make, feel free to comment or create a branch
