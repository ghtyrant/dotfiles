#!/bin/bash

WS_NUM=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).num')
i3-input -F "rename workspace to \"$WS_NUM %s\"" -P "Name: "
