#!/bin/bash

exec $HUE_HOME/build/env/bin/supervisor

ip=`awk 'END{print $1}' /etc/hosts`

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e " You can now access to the following Cloudera Hue GUI:"
echo -e ""
echo -e "\tCloudera Hue:                   http://$ip:8888"
echo -e "--------------------------------------------------------------------------------\n\n"

