#!/usr/bin/env bash
set -euo pipefail

PATH="$HOME/.basher/bin:$PATH"

if [[ $lidarr_eventtype == 'Test' ]]; then
  exit 0
fi

source dotenv
.env export BETANIN_API_KEY BETANIN_HOST

echo "$lidarr_addedtrackpaths"
lidarr_first_track=$(echo "$lidarr_addedtrackpaths" | cut -d '|' -f1)
lidarr_album_path=$(dirname "$lidarr_first_track")
echo "Path: $lidarr_album_path"
echo "Album MBID: $lidarr_album_mbid"
echo "Running betanin"

curl \
    --request POST \
    --data-urlencode "path=$lidarr_album_path" \
    --data-urlencode "name=$lidarr_album_path" \
    --header "X-API-Key: $BETANIN_API_KEY" \
    "http://$BETANIN_HOST/api/torrents"
