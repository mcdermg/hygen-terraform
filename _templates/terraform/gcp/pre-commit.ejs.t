---
to: .pre-commit-config.yaml
---
repos:
- repo: https://github.com/antonbabenko/pre-commit-terraform
  rev:  v1.64
  hooks:
    - id: terraform_fmt
    - id: terraform_validate
    - id: terraform_docs
