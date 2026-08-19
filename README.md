
# nix-carmeet

My personal declarative NixOS configuration.

This repository contains my NixOS, Home Manager, Niri, and Noctalia configuration.

---

## Requirements

- NixOS
- Flakes enabled
- Git

Clone the repository from your home directory, in the carmeet user:

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

## Useful Commands

Update flake:

```bash
nix flake update
```

Collect old generations:

```bash
sudo nix-collect-garbage -d
```
Or:

```bash
nixfreespace
```

Validate Niri configuration:

```bash
niri validate
```

## Desktop Environment

- Niri
- Noctalia
- Ghostty
- Helix
- Bash
- Firefox
- Stylix
- Home Manager
