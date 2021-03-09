#!/bin/bash
export DF_LOG_FILE=${HOME}/environment/tmp/df_logs/df_logs.log
echo `df / | sed -n '2,1p'` `date "+%Y%m%d_%H%M%S"` >> ${DF_LOG_FILE}