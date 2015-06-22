#!/usr/bin/env bash
set -e

git submodule update --remote
./get_pages.sh
git commit -a -m'update_site'
git push
