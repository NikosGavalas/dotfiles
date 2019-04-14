#!/bin/bash

# see: https://askubuntu.com/questions/448045/how-to-make-my-maximum-screen-resolution-to-be-detected-by-ubuntu

xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
xrandr --addmode DVI-I-2 1680x1050_60.00
