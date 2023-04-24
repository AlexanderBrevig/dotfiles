#!/usr/bin/env bash

_ensure() {
  git="$1"
  path="$2"
  if [ ! -d "$path" ] 
  then
    git clone --depth 1 "$git" "$path"
  fi
}

# Tools and projects
_ensure git@github.com:AlexanderBrevig/helix ~/github.com/helix
_ensure git@github.com:raspberrypi/pico-sdk.git ~/github.com/pico-sdk
_ensure git@github.com:raspberrypi/picotool.git ~/github.com/picotool
_ensure git@gitlab.com:alexanderbrevig/kicad ~/gitlab.com/kicad
_ensure git@github.com:SSBMTonberry/pwrb0xx ~/github.com/pwrb0xx
_ensure git@github.com:AlexanderBrevig/luxonome-node ~/github.com/luxonome-node
_ensure git@github.com:AlexanderBrevig/luxonome-hub ~/github.com/luxonome-hub
_ensure git@github.com:AlexanderBrevig/luxonome.github.io ~/github.com/luxonome.github.io
_ensure git@github.com:AlexanderBrevig/LEB-Synth ~/github.com/LEB-Synth
_ensure git@github.com:AlexanderBrevig/kicad-lib-docs ~/github.com/kicad-lib-docs
_ensure git@github.com:AlexanderBrevig/AlexanderBrevig ~/github.com/AlexanderBrevig
_ensure git@github.com:AlexanderBrevig/tree-sitter-task ~/github.com/tree-sitter-task
_ensure git@github.com:AlexanderBrevig/yalex ~/github.com/yalex
_ensure git@github.com:AlexanderBrevig/yalexide ~/github.com/LEB-Synth

# Coldflesh
_ensure git@github.com:coldflesh/overview ~/coldflesh/overview
_ensure git@github.com:coldflesh/coldflesh.github.io ~/coldflesh/coldflesh.github.io
_ensure git@github.com:coldflesh/bionic ~/coldflesh/bionic
_ensure git@github.com:coldflesh/eradicate ~/coldflesh/eradicate
_ensure git@github.com:coldflesh/aeons-absorbed ~/coldflesh/aeons-absorbed
_ensure git@github.com:coldflesh/serenity ~/coldflesh/serenity
_ensure git@github.com:coldflesh/within ~/coldflesh/within
_ensure git@github.com:coldflesh/redeploy ~/coldflesh/redeploy
_ensure git@github.com:coldflesh/intruders ~/coldflesh/intruders
_ensure git@github.com:coldflesh/phantasmagoric-realms ~/coldflesh/phantasmagoric-realms
_ensure git@github.com:coldflesh/deficiency ~/coldflesh/deficiency
