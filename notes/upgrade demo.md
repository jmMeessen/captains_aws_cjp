# Notes to support the Auto Upgrade demonstration

**Pre-requiste**: For the demo to be representative, an incremental update must be available on the latest release.

For this demo to work, branch "upgrade_demo" must be checked out.

1. Position your self in the toolbox directory 
2. start the infra with `./start_infra.sh`
3. Run the base ansible script `./run_ansible.sh`. It will install an outdated system.
4. get the initial admin password with `./cjoc_display_admin_token.sh`
5. connect to the CJOC (`./cjoc_http.sh`) and complete registration.
6. note that the wizard tells that there is an incremental available on the outdated version and a new version. This can also be seen on the main screen. 
7. perform the OS based Jenkins upgrade with Ansible (`./demo_upgrade_system.sh`). Explain the output.
8. reconnect to the system to show the result of the upgrade. => Only one item is showing: an incremental release is available.
9. update the startup file with `./demo_enable_auto_update.sh`
10. connect to the server via SSH and show the `/etc/default/cloudbees-core-oc` file where the java arguments have been changed.
11. Still in the SSH session, restart the CJOC with `sudo service cloudbees-core-oc restart`. Restart from the UI will not load the environment variable.
12. Reconnect to the CJOC web interface: the warning is gone. Show BeeKeeper for more details.


