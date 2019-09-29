# captains_aws_cjp
My experiments with configuring a CloudBees Core for Traditional Platforms (ex CJP) on AWS with Ansible.

## TODO
My current plan is:

- [ ] (terraform) Use a remote state (S3) file so that environment works from two laptops
- [ ] (Ansible) start docker SSH agent
- [ ] (Ansible) enable SSO with LDAP
- [ ] (Ansible) populate automatically some reference jobs 
- [ ] (Ansible) experiment with the latest CloudBees JCasC preview (2.176.4.3) 
- [ ] (Ansible - improvement) Move as many constants to variable file

## references

- [How to use this environment](notes/notes.md)
- [Ansible scripts overview](notes/doc.md)
- [Toolbox inventory](notes/toolbox_inventory.md)
- [bibliography](notes/bibliography.md)