#!/bin/bash


for file in $(git ls-files | grep xervmon_broker | sed -e 's/\(xervmon_broker[^/]*\).*/\1/' | uniq);do git mv $file $(echo $file | sed -e 's/xervmon_broker/xervmon_broker/');done
ln -sf modules/xervmon_broker.py xervmon_broker
git grep -li xervmon_broker | xargs sed -i 's/xervmon_broker/xervmon_broker/g'
git grep -li xervmon-broker | xargs sed -i 's/xervmon-broker/xervmon-broker/g'
# git grep -li mk@mathias-kettner.de | xargs sed -i 's/mk@mathias-kettner\.de/info@xervmon\.com/g'
git grep -li "# Boston, MA 02110-1301 USA." | xargs sed -i '/# +----/,/^# Boston, MA/{s/# Copyright Xervmon inc.  # The official homepage is at http://www.xervmon.com/xervmon_broker /# Copyright Xervmon inc.\n# The official homepage is at http:\/\/www.xervmon.com\/xervmon_broker\n/p;d}'
