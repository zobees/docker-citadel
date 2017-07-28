#!/usr/bin/env bash

export LD_LIBRARY_PATH=$(dirname $CITADEL_DIR)

if [ -n "STEAMCMD_APP_BETA" ]; then
  BETA="-beta $STEAMCMD_APP_BETA"
fi

steamcmd.sh +login anonymous +force_install_dir $CITADEL_DIR +app_update $STEAM_APP_ID $BETA +quit

$CITADEL_DIR/CitadelServer.sh