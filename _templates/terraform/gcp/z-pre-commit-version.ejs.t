---
sh: |
  export PRECOMVER=`curl --silent "https://api.github.com/repos/antonbabenko/pre-commit-terraform/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
  sed  -i 's|v1.64|'$PRECOMVER'|g' .pre-commit-config.yaml
---
