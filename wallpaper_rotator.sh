#!/bin/bash
# ------------------------------------------------------------------------------
# Autor: Ricard Santiago Raigada García 
# Fecha: 2025-04-24
# Descripción: Randomly change the wallpaper in GNOME by selecting
#       .webp images from 'walls' subfolders within the main folder.
# ------------------------------------------------------------------------------

WALL_DIR="Enter your wallpaper directory here" # Replace with your wallpaper directory
if [ ! -d "$WALL_DIR" ]; then
    echo "The $WALL_DIR directory does not exist."
    exit 1
fi

mapfile -t WALLPAPERS < <(find "$WALL_DIR" -type d -name "walls" -exec find {} -type f -name "*.webp" \;)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No se encontraron wallpapers."
    exit 1
fi

RANDOM_WALL=$(shuf -n 1 -e "${WALLPAPERS[@]}")

gsettings set org.gnome.desktop.background picture-uri "file://$RANDOM_WALL"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$RANDOM_WALL"
