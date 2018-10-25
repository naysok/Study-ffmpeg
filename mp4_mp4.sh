#!/usr/bin/env bash
ffmpeg -f concat -i mylist.txt -c copy output.mp4
