#!/usr/bin/env bash
cd ~/dotfiles
git add -A
git commit -m "Auto backup on $(date)"
git push origin main
