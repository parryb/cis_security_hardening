#!/bin/bash
# shellcheck disable=SC2154
awk -F : -v P="$PT_inactive" '(/^[^:]+:[^!*]/ && ($7~/(\s*|-1)/ && $7 > P)){print $1 " " $7}' /etc/shadow

exit 0
