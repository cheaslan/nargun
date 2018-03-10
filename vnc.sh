#!/bin/bash
echo "[i] VNC application runner"
if [[ $# -eq 0 ]] ; then
	echo "[e] Application name missing. Try $0 '/path/app args'"
	exit 1
fi
echo "[i] Running x11vnc. Connect using your vnc client."

/usr/bin/x11vnc -create -env FD_PROG="$1" \
	-env X11VNC_FINDDISPLAY_ALWAYS_FAILS=1 \
        -env X11VNC_CREATE_GEOM=${1:-1280x1024x24} \
        -gone 'killall Xvfb' \
        -bg -nopw -o x11vnc.log
echo "[i] Done!"
