#!/usr/bin/python
import os

files = os.listdir("/home/matt/Pictures/wallpapers/")
files = str(files)
wallpaper = files.replace("'","")
wallpaper = wallpaper.replace(" ", "")
print(wallpaper)
