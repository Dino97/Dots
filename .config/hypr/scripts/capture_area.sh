#!/bin/bash

tmpfile=$(mktemp --suffix=.png)

cleanup() {
	rm -f "$tmpfile"
}

trap cleanup EXIT

region=$(slurp)
if [ -z "$region" ]; then
	exit 1
fi

grim -l 0 -g "$region" "$tmpfile" && \
	wl-copy < "$tmpfile" && \
	notify-send -a "grim" -t 5000 -u low "Screenshot taken" "The screenshot has been copied to the clipboard." -i "$tmpfile"
