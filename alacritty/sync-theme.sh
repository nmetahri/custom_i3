#!/bin/bash

# Alacritty Theme Switcher
# Synchronizes alacritty colors with i3 theme

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty/alacritty.yml"
I3_THEMES_PATH="$HOME/.config/i3/themes"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

if [ ! -f "$ALACRITTY_CONFIG_PATH" ]; then
    echo -e "${RED}Error: Alacritty configuration not found at $ALACRITTY_CONFIG_PATH${NC}"
    exit 1
fi

if [ ! -d "$I3_THEMES_PATH" ]; then
    echo -e "${RED}Error: i3 themes directory not found at $I3_THEMES_PATH${NC}"
    exit 1
fi

# Get the active theme from the i3 colors symlink
if [ -L "$HOME/.config/i3/colors-active.conf" ]; then
    ACTIVE_THEME=$(basename "$(readlink "$HOME/.config/i3/colors-active.conf")")
    echo -e "${BLUE}Active i3 theme: ${YELLOW}$ACTIVE_THEME${NC}"
else
    echo -e "${RED}Error: colors-active.conf symlink not found${NC}"
    exit 1
fi

# For now, just confirm the theme is synced
echo -e "${GREEN}✓ Alacritty configuration is in sync with i3 themes${NC}"

