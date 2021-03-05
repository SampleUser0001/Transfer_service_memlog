#!/bin/bash

vmstat -tn 5 | tee /tmp/memlog.txt 1> /dev/null &
