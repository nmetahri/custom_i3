#!/bin/bash

# Répertoire contenant les scripts xrandr
SCRIPT_DIR="$HOME/.config/i3/scripts/xrandr"

# Liste les scripts disponibles
CHOICE=$(ls "$SCRIPT_DIR" | dmenu -i -p "Choisir un profil d'affichage:")

# Vérifie si un choix valide a été fait et exécute le script sélectionné
if [ -n "$CHOICE" ]; then
    bash "$SCRIPT_DIR/$CHOICE"
fi
