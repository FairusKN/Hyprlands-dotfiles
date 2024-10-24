#!/usr/bin/bash

set -e  # Stop on any error
trap "printf '\nOk! Quitting because you entered an exit signal.\n'; exit 1" SIGINT

printf "\n"
echo "#######################"
echo "## Hyprland Dotfiles ##"
echo "#######################"
printf "\n"

CONFIG_DIR="$HOME/.config"
DOTFILES_DIRS=("anyrun" "fastfetch" "fish" "hypr" "kitty" "swaync" "wal" \
               "wallpapers" "waybar" "wlogout")
DOTFILES_BACKUP_DIR="$HOME/hyprland-dotfiles-bkp"
TRASH_DIR="$HOME/.local/share/Trash/files"

echo "Welcome to my dotfiles installation script!"

echo "WARN! Running this script may cause problems with your system."
echo "By continuing, you accept responsibility for any issues that arise."

backup_previous_dotfiles() {
    echo -n "Would you like to make a backup of the current dotfiles? [y/n] "
    read -r make_backup_answer
    printf "\n"

    if [[ "$make_backup_answer" =~ ^[yY]$ ]]; then
        echo "[info] Creating backup directory at $DOTFILES_BACKUP_DIR"

        if [[ -d "$DOTFILES_BACKUP_DIR" ]]; then
            echo "Backup directory already exists!"
            echo -n "Override it with the current configuration? (Will be deleted forever) [y/n] "
            read -r override_backup

            if [[ "$override_backup" =~ ^[yY]$ ]]; then
                echo "Overwriting backup folder."
                mv -f "$DOTFILES_BACKUP_DIR" "$TRASH_DIR"
            else
                echo "Skipping backup creation."
                return
            fi
        fi

        mkdir -p "$DOTFILES_BACKUP_DIR"

        for dir in "${DOTFILES_DIRS[@]}"; do
            if [[ -d "$CONFIG_DIR/$dir" ]]; then
                echo "-> Backing up $dir"
                cp -r "$CONFIG_DIR/$dir" "$DOTFILES_BACKUP_DIR"
            else
                echo "[info] Skipping backup for $dir; not found."
            fi
        done
        echo "Backup completed!"
    else
        echo "Skipping backup. Current settings will be overwritten."
    fi
}

apply_dotfiles() {
    printf "\n"
    backup_previous_dotfiles
    printf "\n"

    echo "Starting dotfiles installation..."

    for dir in "${DOTFILES_DIRS[@]}"; do
        if [[ -d "$CONFIG_DIR/$dir" ]]; then
            echo "-> Removing existing $dir"
            rm -rf "$CONFIG_DIR/$dir"
        fi

        echo "-> Installing $dir to $CONFIG_DIR/$dir"
        cp -r "./$dir" "$CONFIG_DIR/$dir"
    done

    apply_wallpapers

    echo "All done! Enjoy your new setup. :3"
    echo "If you encounter issues, please report at: https://github.com/retrozinndev/Hyprland-Dots/issues"
    printf "\n"
}

apply_wallpapers() {
    echo -n "Would you like to apply the wallpapers folder? :3 [y/n] "
    read -r input_wallpaper
    printf "\n"

    if [[ "$input_wallpaper" =~ ^[yY]$ ]]; then
        echo "Thanks for using the wallpapers! Note that I'm not the author."
        echo "Sources: https://github.com/retrozinndev/Hyprland-Dots/WALLPAPER_SOURCES.md"

        echo "-> Copying wallpapers to ~/wallpapers"
        mkdir -p "$HOME/wallpapers"
        cp -r "./wallpapers/"* "$HOME/wallpapers/"
    else
        echo "Skipping wallpapers. You can create ~/wallpapers and press 'SUPER + W' to select one!"
    fi
}

# Main script logic
echo -n "Do you want to install the dotfiles? [y/n] "
read -r input

if [[ "$input" =~ ^[yY]$ ]]; then
    apply_dotfiles
else
    printf "Okay, exiting as you requested. Bye bye!\n"
    exit 0
fi

printf "\n"
