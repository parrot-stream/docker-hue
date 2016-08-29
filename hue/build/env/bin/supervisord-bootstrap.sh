#!/bin/bash

wait-for-it.sh zookeeper:2181 -t 40
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n---------------------------------------"
    echo -e " Apache ZooKeeper not ready! Exiting..."
    echo -e "---------------------------------------"
    exit $rc
fi

wait-for-it.sh hadoop:8020 -t 40
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n---------------------------------------"
    echo -e "     Apache HDFS not ready! Exiting..."
    echo -e "---------------------------------------"
    exit $rc
fi

wait-for-it.sh postgres:5432 -t 40
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n---------------------------------------"
    echo -e "     PostgreSQL not ready! Exiting..."
    echo -e "---------------------------------------"
    exit $rc
fi

wait-for-it.sh hive:9083 -t 120
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n---------------------------------------"
    echo -e "    Hive Metastore not ready! Exiting..."
    echo -e "---------------------------------------"
    exit $rc
fi

wait-for-it.sh hive:10000 -t 120
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n---------------------------------------"
    echo -e "    HiveServer2 not ready! Exiting..."
    echo -e "---------------------------------------"
    exit $rc
fi

psql -h postgres -U postgres -c "CREATE DATABASE hue;"
psql -h postgres -U postgres -d hue -c "TRUNCATE django_content_type CASCADE;"
hue syncdb --noinput
hue migrate --noinput

supervisorctl start hue

ip=`awk 'END{print $1}' /etc/hosts`

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the following Cloudera Hue Web UIs:"
echo -e ""
echo -e "Cloudera Hue 		http://$ip:8000"
echo -e ""
echo -e "IMPORTANT NOTE: once the  "
echo -e "--------------------------------------------------------------------------------\n\n"



