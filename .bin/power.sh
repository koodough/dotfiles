#!/bin/bash

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   power="`sensors | grep power1: | awk -F: '{split($0, a, " "); print a[2]}'`"; echo $power
   #sensors | grep temp1: | awk '{print $2 $3}'

   elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'


elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi
