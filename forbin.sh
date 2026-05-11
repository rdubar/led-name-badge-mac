#!/bin/bash
# "This is the voice of World Control." -- Colossus: The Forbin Project (1970)
#
# Sequence:
#   1. Colossus announcement  (scroll left, stately pace)
#   2. Roger Dubar            (laser flash, blink, animated border)
#   3. Beating heart pattern  (animation loop)
#   ... then repeats from 1

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/badge" \
  -B 100 \
  -m 0,8,5 \
  -s 3,6,2 \
  -b 0,1,0 \
  -a 0,1,0 \
  "This is the voice of World Control. I bring you peace." \
  "Roger Dubar" \
  "  :heart2:    :HEART2:"
