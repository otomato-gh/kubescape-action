#!/bin/sh
set -eax

echo "https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest"
curl -sL -o /usr/bin/kubescape \
    https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest
    
chmod +x /usr/bin/kubescape

kubescape --version 

# specifying output file to save results to

if [ $4 == "json" ]
then  
  saveto="--format-version v2 --output results.json"
elif [ $4 == "junit" ] 
then 
  saveto="--output results.xml"
elif [ $4 == "pdf" ] 
then 
  saveto="--output results.pdf"
fi

# checking whether the threshold is empty or not 

if test -z "$3"
then 
kubescape scan framework nsa $2 -f $4 $saveto
else 
kubescape scan framework nsa $2 -t $3 -f $4 $saveto
fi 
