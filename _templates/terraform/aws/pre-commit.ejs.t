---
to: .pre-commit-config.yaml
---
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
    -   id: end-of-file-fixer
    -   id: trailing-whitespace
- repo: https://github.com/antonbabenko/pre-commit-terraform
  rev:  v1.64
  hooks:
    - id: terraform_fmt
    - id: terraform_validate
    - id: terraform_docs
