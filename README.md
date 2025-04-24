# GNOME-Wallspin

A lightweight systemd-based script to randomly change your wallpaper in GNOME using `.webp` images from organized subfolders.

## Project Structure

GNOME-Wallspin/  
├── systemd/user/  
│   ├── wallpaper.service  
│   └── wallpaper.timer  
├── wallpaper_rotator.sh  
└── README.md

## Description

The `wallpaper_rotator.sh` script selects a random `.webp` image from any `walls` subfolder under a defined main wallpaper directory and sets it as the GNOME desktop background.

The systemd timer (`wallpaper.timer`) is configured to trigger the change daily at 09:00 AM.

## Installation

1. Move the script to your scripts directory:
```bash
mkdir -p ~/scripts
mv wallpaper_rotator.sh ~/scripts/
chmod +x ~/scripts/wallpaper_rotator.sh
```

2. Copy the systemd unit files to your user systemd directory:
```bash
mkdir -p ~/.config/systemd/user
cp systemd/user/wallpaper.* ~/.config/systemd/user/
```

3. Reload systemd and enable the timer:
```bash
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable --now wallpaper.timer
```

## Notes

- Update the `WALL_DIR` variable inside `wallpaper_rotator.sh` to point to your actual wallpaper folder.
- Ensure that `DISPLAY` and `DBUS_SESSION_BUS_ADDRESS` are properly configured, especially if using remote sessions or multiple user sessions.

## Author

Ricard Santiago Raigada García  
Date: April 24, 2025
