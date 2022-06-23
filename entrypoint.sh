#!/bin/bash
set -eax

echo "https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest"
curl -sL -o /usr/bin/kubescape \
    https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest
    
chmod +x /usr/bin/kubescape

kubescape --version 

# specifying output file to save results to`
$filetimestamp =`date + "%Y_%m_%d_%T"`

echo "Output format is set to: $4"

if [[ "$4" == "json" ]]; then  
export savetostr="--format-version v2 --output results_$filetimestamp.json"
echo "Output format is set to: $4, so we'll save the results with $savetostr"
elif [[ "$4" == "junit" ]]; then 
export savetostr="--output results_$filetimestamp.xml"
echo "Output format is set to: $4, so we'll save the results with $savetostr"
elif [[ "$4" == "pdf" ]]; then 
export savetostr="--output results_$filetimestamp.pdf"
echo "Output format is set to: $4, so we'll save the results with $savetostr"
fi

# checking whether the threshold is empty or not 

if test -z "$3"
then 
kubescape scan framework nsa $2 -f $4 $savetostr
else 
kubescape scan framework nsa $2 -t $3 -f $4 $savetostr
fi



