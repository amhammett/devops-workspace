.PHONY: test

repo_name      = devops-workspace
vault_password = --vault-password-file ~/.secrets/$(repo_name).vault
python_path    = $(shell which python)
ansible_cmd    = AWS_PROFILE=$(profile) ansible-playbook $(vault_password)
ansible_local  = $(ansible_cmd) -i localhost, -e "ansible_python_interpreter=$(python_path)"

# defaults
profile ?= dev
region  ?= ap-southeast-2

edit-secrets:
	ansible-vault $(vault_password) edit vars/secrets.yml

devops-deploy:
	$(ansible_cmd) devops-deploy.yml -e env=$(env) -e profile=$(profile) -e region=$(region) $(debug)

devops-stack:
	$(ansible_local) devops-stack.yml -e env=$(env) -e profile=$(profile) -e region=$(region) $(debug)
