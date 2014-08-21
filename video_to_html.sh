#!/bin/bash

SCRIPT_NAME=`basename $0`
USAGE_STRING="
Usage: $SCRIPT_NAME VIDEO_SOURCE [WEBPAGE_TITLE [HTML_SOURCE_FILE]]

Examples:

	user@host:~ $ $SCRIPT_NAME the_avengers_2012.mp4
	user@host:~ $ $SCRIPT_NAME the_avengers_2012.mp4 \"The Avengers (2014)\"
	user@host:~ $ $SCRIPT_NAME the_avengers_2012.mp4 \"The Avengers (2014)\" my_custom_source.html

Recommended media types: MP4, WebM, Ogg
"

# If no arguments provided print usage
if [[ $# -eq 0 ]] ; then
    echo -e "$USAGE_STRING"
    exit 0
fi

if [ -z "$1" ]; then
	echo "No VIDEO_SOURCE provided. Exiting with error status."
	exit 1
fi

# First argument is VIDEO_SOURCE
VIDEO_SOURCE=$1
echo "Using VIDEO_SOURCE: $VIDEO_SOURCE"

# Default webpage title to video source without file extension if not provided
DEFAULT_WEBPAGE_TITLE=${VIDEO_SOURCE%%.*}
WEBPAGE_TITLE=${2:-$DEFAULT_WEBPAGE_TITLE}
echo "Using WEBPAGE_TITLE: $WEBPAGE_TITLE"

# Default HTML source if not provided

DEFAULT_HTML_SOURCE_FILE=video_html_template.html
HTML_SOURCE_FILE=${3:-$DEFAULT_HTML_SOURCE_FILE}
echo "Using HTML_SOURCE_FILE: $HTML_SOURCE_FILE"
echo "HTML_SOURCE_FILE cat output below:"

cat $HTML_SOURCE_FILE

# sed -e "s;%PORT%;$1;g" -e "s;%HOST%;$2;g" -e "s;%DIR%;$3;g" template.txt > script.sh

# $ bash ./create.sh 1986 example.com /tmp
# $ bash ./script.sh
# Hello, I am a server running from /tmp and listening for connection at example.com on port 1986 and my configuration file is /tmp/server.conf
