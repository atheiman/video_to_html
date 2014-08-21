#!/bin/bash

SCRIPT_NAME=`basename $0`
USAGE_STRING="
Usage: $SCRIPT_NAME VIDEO_SOURCE [OUTPUT_HTML_FILE [WEBPAGE_TITLE [HTML_SOURCE_FILE]]]

Examples:

	$SCRIPT_NAME the_avengers_2012.mp4
	$SCRIPT_NAME the_avengers_2012.mp4 the_avengers.html
	$SCRIPT_NAME the_avengers_2012.mp4 the_avengers.html \"The Avengers (2014)\"
	$SCRIPT_NAME the_avengers_2012.mp4 the_avengers.html \"The Avengers (2014)\" my_custom_source.html

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

DEFAULT_WEBPAGE_TITLE=${VIDEO_SOURCE%%.*}

# Default HTML output file
DEFAULT_OUTPUT_HTML_FILE=$DEFAULT_WEBPAGE_TITLE.html
OUTPUT_HTML_FILE=${2:-$DEFAULT_OUTPUT_HTML_FILE}
echo "Using OUTPUT_HTML_FILE: $OUTPUT_HTML_FILE"

# Default webpage title to video source without file extension if not provided
WEBPAGE_TITLE=${3:-$DEFAULT_WEBPAGE_TITLE}
echo "Using WEBPAGE_TITLE: $WEBPAGE_TITLE"

# Default HTML source if not provided
DEFAULT_HTML_SOURCE_FILE=video_html_template.html
HTML_SOURCE_FILE=${4:-$DEFAULT_HTML_SOURCE_FILE}
echo "Using HTML_SOURCE_FILE: $HTML_SOURCE_FILE"

# sed the new HTML file
sed -e "s;%WEBPAGE_TITLE%;$WEBPAGE_TITLE;g" -e "s;%VIDEO_SOURCE%;$VIDEO_SOURCE;g" $HTML_SOURCE_FILE > $OUTPUT_HTML_FILE

echo "Successfully created new HTML5 video file: $OUTPUT_HTML_FILE"
