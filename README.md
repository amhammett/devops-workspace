DevOps Workspace
================

DevOps workspace and tools

Development Environment
-----------------------

Most developers will require an AWS development environment that can be used to provision
and configure environments.

Like our other repositories, provisioning and configuring a host can be done via

```bash
# provision
make devops-stack env=<environment-name>

# configure
make devops-deploy env=<environment-name>
```

It is also possible to override `profile` (dev) and `aws_region` (ap-southeast-2) if required.


Secrets
-------

If you're working off this repository and don't have access to the vault password you can
generate your own.

```
#./vars/secrets.yml
ssh_keys:
  orchestration:
    public:
      <profile>: "<public key in plain text>"
    private:
      <profile>: "<private key base64 encoded>"

dyn_ssh_orchestration_key: "{{ssh_keys['orchestration']['private'][profile]}}"
```

the above yml will allow you to specify separate ssh keys for different profiles used.
