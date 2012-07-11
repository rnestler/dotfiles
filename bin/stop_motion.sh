#!/bin/bash

# This script converts a folder with JPEG images to a MJPEG encoded avi file

# rename files so ffmpeg recognizes the order
nummer=0
for file in *.JPG; do
	mv $file $(printf P%04d.JPG $nummer)
	nummer=$(($nummer+1))
done

# reverse of the above
#nummer=$(ls *.JPG|wc -w)
#for (( i=0; i<104; i++ )); do
#	mv $(printf small_P%02d.JPG $i) $(printf rev_small_P%02d.JPG $nummer)
#	nummer=$(($nummer-1))
#done

# convert them to a smaller resolution
for file in *.JPG; do
	convert $file -geometry 720x576 small_$file
	# with rotate
	#convert $file -extent 2816x2816 -rotate 90 -geometry 720x720 small_$file
done

fps=12
ffmpeg -r $fps -f image2 -i small_P%04d.JPG -r $fps -c:v copy output.avi

