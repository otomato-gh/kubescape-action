### 🛡️ ARMO's kubescape in your CI: made with passion by 🍅 Otomato

This action helps to integrate the kubescape tool into your pipelines. Supported parameters are the following:
How to use kubescape in CI. Sample actions. Desired features (schematically, with parameters):
```
- name: Run Kubescape
  uses: otomato-gh/kubescape-action@master
  with:
    ksversion: 'v2.0.155' 
    # [Required] 
    # A version of involved binary (See ARMO releases page: https://github.com/armosec/kubescape/releases ).
    path: '.' 
    # [Optional] 
    # A path where to look for deployments' YAML to scan. Default is repo's home dir.
    threshold: 20 
    # [Optional] 
    # A threshold value 0..100. This action will fail if, in terms of vulnerability points, your deployment scores more than the value specified.
    format: 'json' 
    # [Optional] 
    # An output's format: "pretty-printer", "json", "junit", "prometheus", "pdf" (default is "pretty-printer" (raw console dump)).
```         
Scanning process itself is to be performed inside a docker container. For "json", "junit" and "pdf" this action provides report saving implemented as an uploaded artifact. This mean the report may be downloaded for consiquent analysis.
