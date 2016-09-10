#!/bin/bash

if [[ ! -z  $httpProxyHost  ]]; then
    cp settings.xml /root/.m2/settings.xml
else
    rm -f /root/.m2/settings.xml 2>/dev/null
fi
