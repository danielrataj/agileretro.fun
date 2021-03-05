#!/bin/sh

set -uo pipefail

rm -f ./.quasar.env.json
touch ./.quasar.env.json

RETRO_FILE_URL=${RETRO_FILE_URL}

echo '{"production":{"RETRO_FILE_URL":"'$RETRO_FILE_URL'"}}' >> ./.quasar.env.json

npm run build

exec yarn production
