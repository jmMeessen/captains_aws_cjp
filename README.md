# captains_aws_cjp
My experiments with configuring a CJP on AWS

## TODO
My current plan is 

- [x] (Terraform) spin two machines (CJOC and Client Master) on AWS
- [ ] (Ansible) harden the machine
- [x] (Ansible) install CJOC
- [x] (Ansible) configure it without the Installation Wizard (license load, initial user, basic security settings, etc)
- [ ] (Ansible) install the minimal set of plugins 
- [x] (Ansible) install CLient Master
- [ ] (Ansible) connect the Client Master to the CJOC
- [ ] (Ansible) implement Oauth authentication and SSO
- [ ] (Ansible) spin fixed and specialized agents (ex Docker)
- [ ] (Ansible) populate automatically some reference jobs 
- [ ] with Ansible, try out the Jenkins configuration as code. 

## references

- [How to use this environment](notes/notes.md)
- [bibliography](notes/bibliography.md)