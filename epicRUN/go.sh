#!/bin/bash
gnome-terminal --geometry=80x15+10+10 -e 'sh -c "set -x; bash epic1.sh; sleep 10; exec bash"'
gnome-terminal --geometry=80x15+10+340 -e 'sh -c "set -x; bash epic2.sh; sleep 10; exec bash"'
gnome-terminal --geometry=80x15+760+10 -e 'sh -c "set -x; bash epic4.sh; sleep 10; exec bash"'
gnome-terminal --geometry=80x15+760+340 -e 'sh -c "set -x; bash epic3.sh; sleep 10; exec bash"'
gnome-terminal --geometry=80x15+10+670 -e 'sh -c "set -x; bash epic5.sh; sleep 10; exec bash"'
gnome-terminal --geometry=80x15+760+670 -e 'sh -c "set -x; bash epic6.sh; sleep 10; exec bash"'
