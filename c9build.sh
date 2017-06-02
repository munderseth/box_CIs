#!/bin/bash

mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C $HOME/bin
CI=true testspace config url http://mark.stridespace.com
testspace -v

# Test
BRANCH_NAME=`git symbolic-ref --short HEAD` 
printenv > printenv.txt

# Push 
testspace test.xml printenv.txt --repo git