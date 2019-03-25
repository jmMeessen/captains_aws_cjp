# Bibliography

This is a list of the references I used while experimenting and learning.

- First steps with Terraform: [initial setup](https://pragmacoders.com/2-creating-an-ec2-instance-with-terraform/) and [setting up SSH](https://pragmacoders.com/3-installing-rails-with-terraform/) 
- Terraform and Ansible: https://alex.dzyoba.com/blog/terraform-ansible/. See also [this article](https://getintodevops.com/blog/using-ansible-with-terraform) on the same subject with some advise about Jenkins.
- the only way to use port 80 is to setup IPTABLES to redirect calls to 80 to port 8888
see https://wiki.jenkins.io/display/JENKINS/Running+Jenkins+on+Port+80+or+443+using+iptables. This [article]((https://blog.ssdnodes.com/blog/tutorial-a-more-secure-ansible-playbook-part-2/)
) gives some examples on how to do these IPtable manipulations with Ansible.

## to read

- Jenkins [configuration-as-code](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/README.md)
- (private) repository with some same sample [CJP related Ansible scripts](https://github.com/cloudbees/ansible-cjp)
- A [terraform module for Jenkins](https://github.com/IGNW/terraform-aws-jenkins)
- Another [discussion about Terraform and Ansible provider](https://nicholasbering.ca/tools/2018/01/08/introducing-terraform-provider-ansible/). This is the associated [Github repository](https://github.com/nbering/terraform-provider-ansible/)

