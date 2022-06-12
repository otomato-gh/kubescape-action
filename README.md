### kubescape in CI
How to use kubescape in CI. Sample actions. Desired features (schematically, with parameters):
```- name: Run Kubescape
        uses: otomato-gh/kubescape-action@master
        with:
          kubescape-version: 'v2.0.155'
          output: 'JSON'
```
From where is possible to get ELF binary version:
```
https://github.com/armosec/kubescape/releases/download/v2.0.158/kubescape-ubuntu-latest
```
