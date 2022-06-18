#!/bin/sh
set -eax

kubescape --version 

# checking whether the threshold is empty or not 

if test -z "$3"
then 
kubescape scan framework nsa $2 deployment.yaml -f $4
else 
kubescape scan framework nsa $2 deployment.yaml -t $3 -f $4 
fi 
