#!/bin/bash
ffmpeg -framerate 30 -start_number 0 -i image%05d.jpg -r 30 -an -vcodec libx264 -pix_fmt yuv420p out1.mp4