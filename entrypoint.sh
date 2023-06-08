#!/bin/bash
set -eax

echo "https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest"
curl -sL -o /usr/bin/kubescape \
    https://github.com/armosec/kubescape/releases/download/$1/kubescape-ubuntu-latest
    
chmod +x /usr/bin/kubescape

echo "Output format is set to: $4"

if [[ "$4" == "json" ]]; then  
export savetostr="--format-version v2 --output results.json"
echo "Output format is set to: $4, so we'll save the results with $savetostr"
elif [[ "$4" == "junit" ]]; then 
export savetostr="--output results.xml"
echo "Output format is set to: $4, so we'll save the results with $savetostr"
elif [[ "$4" == "pdf" ]]; then 
export savetostr="--output results.pdf"
echo "Output format is set to: $4, so we'll save the results with $savetostr"
fi

if test -z "$5"
# checking whether the cluster (kube-context) is empty or not
then
 if test -z "$3"
 # checking whether the threshold is empty or not
 then 
 kubescape scan framework nsa $2 -f $4 $savetostr
 else 
 kubescape scan framework nsa $2 -t $3 -f $4 $savetostr
 fi
else 
 if test -z "$3"
 # checking whether the threshold is empty or not
 then 
 kubescape scan framework nsa --kube-context $5 -f $4 $savetostr
 else 
 kubescape scan framework nsa --kube-context $5 -t $3 -f $4 $savetostr
 fi
fi


