---
sh: |
  export PRECOMVER=`curl -s https://github.com/antonbabenko/pre-commit-terraform/releases/latest | egrep -o '[[:digit:]]{1}\.[[:digit:]]{1,2}\.[[:digit:]]{1,2}'`
  sed  -i 's|1.64|'$PRECOMVER'|g' .pre-commit-config.yaml
---
