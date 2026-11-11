# Eufy Doorbell Audio Trial

Trial 0.8.2-audio.1 overlays reviewed bridge source on the official ARM64
add-on image 0.8.2. It installs no new packages and retains SDK 0.5.0 and
go2rtc 1.9.9. SOURCE_COMMIT identifies the overlaid source revision.

The candidate preserves Bielecki-UK's PR #144 audio implementation and
fubo08's adaptation to current dev, with a focused consumer-cancellation fix.
The source passes 277 tests, Prettier, and syntax checks on Node 24.5.0.

The app imports the existing session, push-registration store and bridge ID
from /share/eufy-audio-trial-seed on first startup. Those runtime files must
never be committed. Stop the original bridge before starting this app.
Credentials go into the app's Configuration form, never the repository.

Default host ports are 3001 (bridge) and 8556 (RTSP). Reconfigure the existing
eufy-sdk integration to this app's internal hostname, ports 3000 and 8554.
Apple Home audio must then be enabled separately on the existing accessory.

Rollback: stop this app, point the integration back at the original app's
hostname, and start the original bridge. Restore the original accessory audio
setting if necessary. Both apps retain their own persistent data.

This trial provides incoming AAC-LC audio. It does not add two-way talk.
