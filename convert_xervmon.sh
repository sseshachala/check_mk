#!/bin/bash

for file in $(git ls-files | grep xervmon_agent | sed -e 's/\(xervmon_agent[^/]*\).*/\1/' | uniq);do git mv $file $(echo $file | sed -e 's/xervmon_agent/xervmon_agent/');done
ln -sf modules/xervmon_agent.py xervmon_agent 
git grep -li xervmon_agent | xargs sed -i 's/xervmon_agent/xervmon_agent/g'
git grep -li xervmon-agent | xargs sed -i 's/xervmon-agent/xervmon-agent/g'
git grep -li mk@mathias-kettner.de | xargs sed -i 's/mk@mathias-kettner\.de/info@xervmon\.com/g'


