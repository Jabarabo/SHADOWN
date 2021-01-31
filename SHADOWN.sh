#!/bin/bash

# Function for option A
function blobdl {
	clear
	echo "Enter the URL for the .m3u8 file below."
	read BLOBADDRESS
	clear
	echo "What would you like to name the video file?"
	read VIDEONAME
	clear
	echo "Starting your totally legit download!"
	ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i "$BLOBADDRESS" -c copy $VIDEONAME.mp4
	}

#Functions for option B
function ytdl_typecheck {
	clear
	echo "Would you like the file to be Audio/Video or just audio?"
	echo ""
	echo "(a) Audio/Video"
	echo "(b) Just audio"
	read YTDLOUTPUT
	clear
	if [ "$YTDLOUTPUT" = "b" ]; then
		cd ~/Music
		ISITAUDIO="--extract-audio --audio-format mp3 --audio-quality 0"
		VIDEOEXTENSION=".mp3"
	else
		ISITAUDIO="--format mp4"
		VIDEOEXTENSION=".mp4"
	fi
}

function ytdl_proper {
	clear
	echo "What would you like to name the video (Without file extension)?"
	read VIDEONAME
	clear
	echo "Paste the URL of the Youtube video."
	read VIDEOADDRESS
	clear
	youtube-dl $ISITAUDIO --output $VIDEONAME$VIDEOEXTENSION $VIDEOADDRESS
	}
	
# Function for option C
function wgetdl {
	clear
	echo "Enter the link for MP4 file below."
	read MPFOURADDRESS
	clear
	echo "What would you like the file to be named?"
	echo "Include the file extension."
	read VIDEONAME
	clear
	echo "Starting your totally legit download!"
	echo ""
	echo "If the cursor is just blinking the download is running."
	echo "Don't touch anything!"
	wget -qc $MPFOURADDRESS -O $VIDEONAME
	}

# Main functioning script
cd ~/Videos
clear
echo -e "Welcome to Jabarabo's \e[1;31mSH\e[0mady \e[1;31mA\e[0mss \e[1;31mDOWN\e[0mloader!"
echo ""
echo "Please select whatever kind of video you're trying to steal"
echo '(a) .M3U8 Blobs'
echo '(b) Youtube Videos'
echo '(c) Literally anything else'
read VIDEOTYPE
if [ "$VIDEOTYPE" = "a" ] 2> /dev/null; then
	blobdl
	fi
if [ "$VIDEOTYPE" = "b" ] 2> /dev/null; then
	ytdl_typecheck
	ytdl_proper
	fi
if [ "$VIDEOTYPE" = "c" ] 2> /dev/null; then
	wgetdl
	fi
clear
echo -e "Video finished copying. \e[1;31mRemember, take what you can give nothing back!\e[0m"
sleep 5
