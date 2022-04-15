# Hygen Terraform

A collection of templates for Hygen to allow creation of Terraform boilerplate with some extra functionality.

## Dependencies

- [git](https://git-scm.com/)
- [Hygen](https://www.hygen.io/)
- [Terraform](https://www.terraform.io/)
- [TFSwitch](https://tfswitch.warrensbox.com/)
- [direnv](https://direnv.net/)
- [pre-commit for terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [pre-commit](https://github.com/antonbabenko/pre-commit-terraform)
- [terrafrom-docs](https://github.com/terraform-docs/terraform-docs#installation)

## Description

The collection of templates will create the required boilerplate for a Terraform project in AWS or GCP. Interactively asks for Terraform version that will be used and injects to the required template. The following files will be created upon executing the Hygen

- main.tf
- backend.tf
- version.tf
- providers.tf
- variables.tf
- oututs.tf
- pre-commit.yaml
- README.md
- LICENSE.md
- .gitignore

### pre-commit
pre-commit is used and the latest version is retrieved and it is inserted into the yaml manifest automatically.  

See [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform) for Terraform. There are some dependencies that are [detailed here](https://github.com/antonbabenko/pre-commit-terraform#1-install-dependencies). The repository uses the following pre commit hooks:

* [terraform fmt](https://github.com/antonbabenko/pre-commit-terraform#terraform_fmt)
* [terraform validate](https://github.com/antonbabenko/pre-commit-terraform#terraform_validate)
* [terrafrom docs](https://github.com/antonbabenko/pre-commit-terraform#terraform_docs)


### Automation

Hygen allows execution of certain commands so some elements of the setup beyond the boilerplate are also automated. On completion of generating the files some actions are also carried out. **Note** Hygen executes the template files in alphabetical order so some files have prefix of `z`,`zz` & `zzz` in order to ensure they are executed after all the files have been generated.

Hygen uses [shell via](https://www.hygen.io/docs/templates/#shell) the `sh:` in the [frontmatter](https://www.hygen.io/docs/templates/#all-frontmatter-properties) section to execute these elements.


#### pre-commit version

The latest version of pre-commit is retrieved from the releases page of GitHub and this is manipulated via SED to be injected into the pre-commit yaml manifest.  

#### Terraform

direnv and terraform are setup so that can quickly get going.

```
direnv allow
tfswitch
terraform init
```

#### git

On completion of generating the files the following commands are run to create a git repository:

```
git init
git add .
git commit -m 'Initial commit'
```

## Deployment

Run the following, dependent on the repository being located at `$HOME/hygen-terraform/_templates`. The idea is t have this sitting on the machine and then copy over as required whenever creating new Terraform for a particular service on a particular cloud provider.

```
cp -r $HOME/repos/hygen-terraform/_templates .
```

Then depending on the cloud provider you will need to run either of the following. You will be asked interactively for what version of Terraform you would like to use.

### AWS
```
hygen terraform aws
```

### GCP
```
hygen terraform gcp
```

### Testing

The following commands may be useful for testing:

```
gh repo delete mcdermg/hygen-test
mcdermg/hygen-test

rm -rf .terraform *.tf .git .gitignore .pre-commit-config.yaml .terraform.lock.hcl _templates *.md .envrc

cp -r $HOME/repos/hygen-terraform/_templates .

hygen terraform gcp
hygen terraform aws

gh repo create --private --remote hygen-test --source .
git push -u hygen-test main
```

## Authors

Gary Mc Dermott

<a href="https://github.com/mcdermg" target="_blank">Github Profile</a>

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
