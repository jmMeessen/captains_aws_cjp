# Upgrading Jenkins demo notes.

**Context:** customer is looking for a way to update his systems with ansible. I checked the bahavior with different forms of upgrades.

## notes

* Using run-of-the-mill Ubuntu LTS AMIs, I install, with `apt-get`, a CJOC and a Client Master by forcing an out-of-date version (2.138.2.2).
    * In the UI show the expected version
    * The availability of a new version is shown in the banner.
* without stopping Jenkins (but being loged out), I perform a `apt-get upgrade` so that the OS and Cloubees Core is updated. 
    * The `apt-get` output shows that cloudbees-core-oc is upgraded to the latest version (2.138.3.1).
    * The UI shows the same version but gives a warning that a revision 2 is available. This revision contains a single updated plugin (`infradna-backup` 3.38.5 -> 3.38.8).
    * Neither beekeeper or plugin manager show the "necessity" to upgrade this plugin (although it is for security reason, thus quite confusing).
* upgrading to the last (security) revision works as expected via the User Interface. This operation installs the required plugin.