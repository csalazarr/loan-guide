#!/bin/sh
# Run before each push: stamps a new build id into the page and version.json,
# so older open copies show the "refresh" warning.
B=$(date -u +%Y%m%d%H%M%S)
sed -i -E "s/const BUILD='[^']*'/const BUILD='$B'/" index.html
printf '{"build":"%s"}\n' "$B" > version.json
echo "$B"
