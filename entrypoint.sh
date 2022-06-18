#!/bin/sh
set -eax

echo "https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest"
curl -sL -o /usr/bin/kubescape \
    https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest
    
chmod +x /usr/bin/kubescape

kubescape --version 

# checking whether the threshold is empty or not 

if test -z "$3"
then 
kubescape scan framework nsa $2 *.yaml -f $4
else 
kubescape scan framework nsa $2 *.yaml -t $3 -f $4 
fi 
