#!/usr/bin/sh

sensors | grep "Tctl" | awk '{print $2}' | sed 's/[^0-9.]//g'
