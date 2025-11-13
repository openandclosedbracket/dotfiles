#!/bin/bash
selected=$(find ~ -type f 2>/dev/null | fzf)
[ -n "$selected" ] && ${TERMINAL:-kitty} -e less "$selected"
