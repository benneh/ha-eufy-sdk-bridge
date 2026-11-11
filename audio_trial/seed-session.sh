#!/bin/sh
set -eu
umask 077
for name in .eufy-session.json .eufy-fcm.json .bridge-id; do
  target="/data/$name"
  if [ ! -s "$target" ]; then
    seed="/share/eufy-audio-trial-seed/$name"
    if [ ! -s "$seed" ]; then
      echo "Required session seed is missing: $name. Refusing a fresh login." >&2
      exit 1
    fi
    cp "$seed" "$target"
    chmod 600 "$target"
  fi
done
exec /bin/sh /run.sh
