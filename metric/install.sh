#!/bin/bash
unzip metricbeat.zip && tar -zxvf metricbeat-*.tar.gz -C /usr/local/ 
mv /usr/local/metric*  /usr/local/metricbeat
cp -f ./metri*.yml  /usr/local/metricbeat/
/usr/local/metricbeat/metricbeta setup && nohup /usr/local/metricbeat/metricbeat -e -c /usr/local/metricbeat.yml &
