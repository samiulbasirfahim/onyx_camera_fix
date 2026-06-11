# Redmi Turbo 4 Pro Camera Fix

**by Samiul Basir Fahim**

---

## What is this?

The Redmi Turbo 4 Pro was manufactured in two hardware batches. Units in the second batch use different camera sensors (`_ii` variants — AAC IMX882, Sunny OV08F, Sunny OV20B40). Global and India ROMs do not include the drivers for this hardware batch, so all cameras fail to work on affected units.

This KernelSU module fixes that by injecting the missing drivers directly into the vendor partition at boot — without modifying any system partition.

---

## What it fixes

- All cameras failing to open or crashing immediately on Global/India ROM
- Restores front, ultrawide, and main wide camera functionality
- Restores flashlight functionality

---

## Known limitation

The main wide camera behaves like a macro lens — it focuses sharply up close but goes blurry beyond roughly 1-2 feet.
Couldn't find a way to fix this, so I decided to release the module anyway, looking for someone with more expertise to take a look at it. The front and ultrawide cameras work perfectly fine, so the device is still fully usable with this limitation.

---

## How it works

At boot, KernelSU overlays the missing `_ii` sensor module and tuning blobs onto the vendor partition. The camera HAL detects them, loads the correct drivers for your hardware, and all cameras initialize normally. Nothing is permanently written to any partition — uninstalling the module fully reverts the device to its previous state.

---

## Requirements

- Redmi Turbo 4 Pro (`onyx`) — second batch hardware
- KernelSU or KernelSU Next
- **Hybrid Mount module with OverlayFS enabled** — required for the vendor partition overlay to work. Install Hybrid Mount from KernelSU Manager and switch the mount mode to OverlayFS before flashing this module.

---

## Installation

1. Download the module zip
2. Open KernelSU Manager → Modules → Install
3. Select the zip and flash
4. Reboot

---

## Uninstall

Disable or uninstall from KernelSU Manager and reboot. No cleanup needed.

---

## How to check if your device is affected

If you are on Global or India ROM and your camera app crashes or shows no cameras, your unit likely has second-batch hardware. Flash this module and reboot to confirm.
