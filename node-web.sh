### starting and stopping a node application ###

#!/bin/bash

##verify if node is installed
if [ -z "$(which node)" ]; then
echo "no node"
exit 1
fi

## start function - starting a web server
start(){

dir=$1

if ! [ -d $dir ]; then
echo "no directory here"
exit 1
fi

cd $dir

npmStart=$(cat package.json | grep -E 'start')

if [ -z $npmStart ]; then
echo "no start script"
exit 1
fi

npm start
}

## stop function - stopping the web server
stop(){

dir=$1

if ! [ -d $dir ]; then
echo "no directory here"
exit 1
fi

cd $dir

npmStop=$(cat package.json | grep -E 'stop')

if [ -z $npmStop ]; then
echo "no stop script"
exit 1
fi

npm stop
}

## running the functions ##

activate=$1

## only allows start and stop string to be uses
if [ $activate != 'start' ] && [ $activate != 'stop' ]; then
echo "not a way to use node"
exit 1
fi

$activate $2
