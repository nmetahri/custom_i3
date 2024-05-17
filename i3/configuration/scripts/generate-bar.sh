#!/bin/bash

# Script pour générer la configuration de la barre avec les couleurs du thème actif
BAR_GENERATED="$HOME/.config/i3/bar-generated.conf"
ACTIVE_THEME="$HOME/.config/i3/colors-active.conf"

# Créer le fichier bar-generated.conf avec la barre complète
cat > "$BAR_GENERATED" << 'EOF'
bar {
	font pango:FontAwesome5Free, FontAwesome5Brands, SymbolsNerdFont, Exo2 15
	status_command SCRIPT_DIR=~/.config/i3blocks/scripts i3blocks
	tray_output primary
	strip_workspace_numbers yes
	workspace_buttons yes
	binding_mode_indicator yes

EOF

# Ajouter les couleurs du thème actif
if [ -f "$ACTIVE_THEME" ]; then
	cat "$ACTIVE_THEME" >> "$BAR_GENERATED"
else
	echo "Erreur: Thème actif non trouvé" >&2
	exit 1
fi

# Fermer le bloc bar
echo "}" >> "$BAR_GENERATED"

