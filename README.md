
# nix-carmeet

My personal declarative NixOS configuration.

This repository contains my NixOS, Home Manager, Niri, and Noctalia configuration.

---

## Requirements

- NixOS
- Flakes enabled
- Git

Clone the repository:

```bash
git clone https://github.com/Papeet2785/nix-carmeet.git
cd nix-carmeet
```

---

## Building the system

Build and switch to this configuration:

```bash
sudo nixos-rebuild switch --flake .#myMachine
```

Or use my fish alias:

```bash
nixbuild
```

To update all flake inputs:

```bash
nix flake update
sudo nixos-rebuild switch --flake .#myMachine
```

or simply:

```bash
nixupgrade
```

---

## External Applications

Some applications are intentionally **not included** in this repository because GitHub has a **100 MB file size limit**. Download them from their official sources instead.

Create an Applications folder:

```bash
mkdir -p ~/Applications
```

---

### Arduino IDE

Download the latest **Linux AppImage**:

https://support.arduino.cc/hc/en-us/articles/360019833020-Download-and-install-Arduino-IDE

Move it into the Applications directory:

```bash
mv ~/Downloads/arduino-ide*.AppImage ~/Applications/
```

Make it executable:

```bash
chmod +x ~/Applications/arduino-ide*.AppImage
```

Run it:

```bash
appimage-run ~/Applications/arduino-ide*.AppImage
```

> The AppImage is recommended because it currently works correctly with my Niri setup.

---

### Processing

Download the latest Linux release:

https://github.com/processing/processing4/releases

Extract it into:

```text
~/Applications/
```

Example:

```text
~/Applications/
└── processing-4.4.8/
```

Make sure the launcher is executable:

```bash
chmod +x ~/Applications/processing-*/processing
```

Run Processing:

```bash
~/Applications/processing-*/processing
```

---

## Useful Commands

Rebuild system:

```bash
sudo nixos-rebuild switch --flake .#myMachine
```

Update flake:

```bash
nix flake update
```

Collect old generations:

```bash
sudo nix-collect-garbage -d
```

Validate Niri configuration:

```bash
niri validate
```

Reload Niri configuration:

```bash
niri msg reload-config
```

---

## Desktop Environment

- Niri
- Noctalia
- Kitty
- Helix
- Fish
- Firefox
- Stylix
- Home Manager

---

## Notes

This repository only contains configuration files.

Large binaries such as AppImages, JDKs, IDEs, and other downloaded software are intentionally excluded from version control. They should be downloaded from their official sources and placed in `~/Applications`.
