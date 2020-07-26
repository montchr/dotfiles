#!/usr/bin/env bash
set -e

# Install JetBrains Mono
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.001/JetBrains.Mono.2.001.zip > JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts 
rm JetBrainsMono.zip

fc-cache -fv
