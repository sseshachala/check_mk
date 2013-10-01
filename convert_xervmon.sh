#!/bin/bash

for file in $(git ls-files | grep check_mk | sed -e 's/\(check_mk[^/]*\).*/\1/' | uniq);do git mv $file $(echo $file | sed -e 's/check_mk/xervmon_broker/');done
ln -sf modules/xervmon_broker.py xervmon_broker
git grep -li check_mk | xargs sed -i 's/check_mk/xervmon_broker/g'
git grep -li check-mk | xargs sed -i 's/check-mk/xervmon-broker/g'
git grep -li mk@mathias-kettner.de | xargs sed -i 's/mk@mathias-kettner\.de/info@xervmon\.com/g'
git grep -li "# Boston, MA 02110-1301 USA." | xargs sed -i '/# +----/,/^# Boston, MA/{s/# | Copyright Mathias Kettner 2013             mk@mathias-kettner.de |/# Copyright Xervmon inc.\n# The official homepage is at http:\/\/www.xervmon.com\/xervmon_broker\n/p;d}'

