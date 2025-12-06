# Greyscale Toggle Script

A simple script to toggle between greyscale and normal color modes on all connected displays using `libvibrant`.

## Features
- Toggles saturation between 0% (greyscale) and 100% (full color)
- Works with both native and Flatpak installations of `libvibrant`
- Automatically detects all connected displays
- Provides visual notifications for state changes
- Supports X11 and Wayland (via `vibrant-cli`)

## Installation

### 1. Install libvibrant
Choose **one** of these methods:

#### Option A: Native Installation
```bash
# For Debian/Ubuntu
sudo apt install libvibrant

# For Fedora
sudo dnf install libvibrant

# For Arch
yay -S libvibrant
```

#### Option B: Flatpak Installation
```bash
flatpak install flathub io.github.libvibrant.vibrantLinux
```

### 2. Download the script
```bash
mkdir -p ~/.local/bin
wget https://raw.githubusercontent.com/leodecarlo/Linux-in-Greyscale/main/greyscale-all.sh -O ~/.local/bin/greyscale-all.sh
```

### 3. Make it executable
```
chmod +x ~/.local/bin/greyscale-all.sh
```

## Usage

- Run ```greyscale-all.sh`` in the terminal, with just ```greyscale-all``` to toggle between greyscale and normal color
- The script will:
    - Detect your display configuration
    - Check current saturation state
    - Toggle to the opposite state
    - Show notification with current status

## Configuration
- The script automatically uses:
  - Native ```vibrant-cli``` if installed
  - Flatpak version if native isn't available
- To customize location: Place the script in any directory in your PATH (e.g., ```~/.local/bin```, ```/usr/local/bin```)


## Set Up Keyboard Shortcut

- Open *Setting > Keyboard Shortcuts*
- Configure as shown:
    - Name: Greyscale (All monitors)
    - Command: /home/user/.local/bin/greyscale-all.sh
    - Shortcut: Press your desired key combo (e.g., Ctrl+G)
- Click Add



