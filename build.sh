#!/usr/bin/env bash
# @AUTHOR: Chun-Jie Liu
# @CONTACT: chunjie.sam.liu.at.gmail.com
# @DATE: 2020-07-22 14:40:58
# @DESCRIPTION:

# Number of input parameters
docker build -t chunjiesamliu/tep-pipeline:0.1 .

echo "-----------------------Image built done-----------------------"

docker run -it --rm chunjiesamliu/tep-pipeline:0.1