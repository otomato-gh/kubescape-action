### kubescape in CI
How to use kubescape in CI. Sample actions. Desired features (schematically, with parameters):
```- name: Run Kubescape
        uses: otomato-gh/kubescape-action@master
        with:
          kubescape-version: 'v2.0.155'
          format: 'json'
```
From where is possible to get a version of involved ELF binary:
```
https://github.com/armosec/kubescape/releases/download/v2.0.158/kubescape-ubuntu-latest
```
