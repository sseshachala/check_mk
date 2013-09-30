#!/bin/bash

for file in $(git ls-files | grep check_mk | sed -e 's/\(check_mk[^/]*\).*/\1/' | uniq);do git mv $file $(echo $file | sed -e 's/check_mk/xervmon_agent/');done
ln -sf xervmon_agent modules/xervmon_agent.py
git grep -l check_mk | xargs sed -i 's/check_mk/xervmon_agent/g'


