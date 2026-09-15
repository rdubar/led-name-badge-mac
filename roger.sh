#!/bin/bash
# roger.sh — Roger's personal LED badge sequence
#
# Sequence (loops automatically):
#   1. "R o g e r"   scroll-left, fast
#   2. "R o g e r"   still, blink + animated border, slow
#   3. 3 smileys     still, blink, slow  (swap :happy: for a cat PNG: :badge/cat.png:)
#   4. "Roger"       laser flash, fast
#   5. "Roger"       curtain drop, blink, slow

# ── Tunable constants ──────────────────────────────────────────────────────────
MSG1="R o g e r"     # spaced-out name for scroll
MSG2="R o g e r"     # spaced-out name for border flash
MSG3=":happy::happy::happy:"  # three icons; replace :happy: with e.g. :badge/cat.png:
MSG4="Roger"          # compact name for laser
MSG5="Roger"          # compact name for curtain

SPEED1=8   # 1=slow … 8=fast
SPEED2=2
SPEED3=3
SPEED4=8
SPEED5=2

MODE1=0    # 0=scroll-left 1=scroll-right 4=still 5=animation 6=drop-down 7=curtain 8=laser
MODE2=4
MODE3=4
MODE4=8
MODE5=7

BLINK1=0   # 0=off 1=on
BLINK2=1
BLINK3=1
BLINK4=0
BLINK5=1

ANTS1=0    # 0=off 1=animated border
ANTS2=1
ANTS3=0
ANTS4=0
ANTS5=0

BRIGHTNESS=100  # 25 / 50 / 75 / 100
# ──────────────────────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/badge" \
  -B "$BRIGHTNESS" \
  -m "$MODE1,$MODE2,$MODE3,$MODE4,$MODE5" \
  -s "$SPEED1,$SPEED2,$SPEED3,$SPEED4,$SPEED5" \
  -b "$BLINK1,$BLINK2,$BLINK3,$BLINK4,$BLINK5" \
  -a "$ANTS1,$ANTS2,$ANTS3,$ANTS4,$ANTS5" \
  "$MSG1" "$MSG2" "$MSG3" "$MSG4" "$MSG5"
