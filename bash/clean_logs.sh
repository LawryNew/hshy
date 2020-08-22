#!/bin/bash

job_log_path=/data/nginx/html/jobs/storage/logs
#job_log_path2=/data/nginx/html/jobs_200602/storage/logs
find $job_log_path  -type f -atime +15 |grep -E "$job_log_path/lumen-2020-[0-1][0-9]-[0-3][0-9].log" |xargs rm -f


#find $job_log_path2  -type f -atime +15 |grep -E "$job_log_path2/lumen-2020-[0-1][0-9]-[0-3][0-9].log" |xargs rm -f




