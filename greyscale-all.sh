#!/usr/bin/env bash
set -euo pipefail

# Pick the right vibrant-cli (native or Flatpak)
if command -v vibrant-cli >/dev/null 2>&1; then
  VIB=(vibrant-cli)
elif command -v flatpak >/dev/null 2>&1 && flatpak info io.github.libvibrant.vibrantLinux >/dev/null 2>&1; then
  VIB=(flatpak run --command=vibrant-cli io.github.libvibrant.vibrantLinux)
else
  notify-send "Vibrant" "vibrant-cli not found. Install libvibrant or the Flathub app."
  exit 1
fi

# All connected outputs (space-separated list)
OUTS=$(xrandr --query | awk '/ connected/{print $1}')
FIRST=$(printf '%s\n' "$OUTS" | head -n1)

# Read current saturation of the first output
SAT="$("${VIB[@]}" "$FIRST" | awk '/Saturation/{print $NF}')"

# If near zero, go to 1; otherwise go to 0
if awk -v s="$SAT" 'BEGIN{exit (s < 0.1)?0:1}'; then
  TARGET=1
else
  TARGET=0
fi

for O in $OUTS; do
  "${VIB[@]}" "$O" "$TARGET"
done

if [ "$TARGET" -eq 0 ]; then
  notify-send "Greyscale ON" "Saturation set to 0 on: $OUTS"
else
  notify-send "Greyscale OFF" "Saturation set to 1 on: $OUTS"
fi

