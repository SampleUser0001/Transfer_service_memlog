#!/bin/bash

vmstat -tn 5 | tee -a /tmp/memlog.txt 1> /dev/null
