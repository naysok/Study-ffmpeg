#!/bin/sh
ffmpeg -i movie.mp4 -ss 0 -r 24 -q 1 sliced_images/image-%5d.jpg