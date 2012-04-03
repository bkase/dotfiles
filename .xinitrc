#!/bin/bash
xbindkeys
xrdb -merge ~/.Xresources
urxvtd &
conky &
dropboxd &
wmname LG3D
exec awesome
