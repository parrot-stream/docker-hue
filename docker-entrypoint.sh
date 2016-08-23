#!/bin/bash

exec $HUE_HOME/build/env/bin/supervisor

ip=`awk 'END{print $1}' /etc/hosts`

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e " You can now access to the following Cloudera Hue Web UI:"
echo -e ""
echo -e "\tCloudera Hue Web UI:                   http://$ip:8888"
echo -e "--------------------------------------------------------------------------------\n\n"

