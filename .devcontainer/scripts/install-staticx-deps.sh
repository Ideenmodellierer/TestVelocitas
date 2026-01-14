#!/usr/bin/env bash
set -euo pipefail

echo "[staticx-deps] Installing system prerequisites for staticx build…"
export DEBIAN_FRONTEND=noninteractive

# Paketlisten aktualisieren
apt-get update

# Für staticx-Source-Build benötigte Tools:
# - scons (Buildsystem)
# - binutils (liefert readelf/objcopy)
# - patchelf (RPATH/Interpreter anpassen)
# - musl-tools (optional; kleinere Bootloader)
apt-get install -y --no-install-recommends \
  scons \
  binutils \
  patchelf \
  musl-tools

# Cleanup
rm -rf /var/lib/apt/lists/*

echo "[staticx-deps] Done."
