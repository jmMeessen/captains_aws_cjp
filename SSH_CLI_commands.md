  add-job-to-view
    Adds jobs to view.
  apply-configuration
    Apply YAML configuration to instance
  approve-controlled-slaves-request
    Approved a request key for a folder to use the node as a controlled slave
  backup-master
    Performs a backup by reading stdin as argument containing the full configuration for the backup in JSON format.
  build
    Builds a job, and optionally waits until its completion.
  cancel-maintenance-window
    Cancels the next scheduled maintenance window. Alerts will not be suppressed.
  cancel-quiet-down
    Cancel the effect of the "quiet-down" command.
  check-alert-condition
    Checks if the specified alert is currently active.
  check-configuration
    Apply YAML configuration to instance
  cjp-copy-item
    Copy an item to another CloudBees Jenkins Platform location.
  cjp-move-item
    Move an item to another CloudBees Jenkins Platform location.
  cjp-promote-item
    Promote an item to another CloudBees Jenkins Platform location.
  clear-maintenance-windows
    Clears all scheduled maintenance windows. No alerts will be suppressed.
  clear-queue
    Clears the build queue.
  client-master-release
    Release a client master from the operations center
  complete-controlled-slaves-request
    Generates a request key for controlled slaves
  complete-maintenance-windows
    Completes the current scheduled maintenance windows. Alerts will not be suppressed until the next scheduled maintenance window (if any).
  configuration-container-delete
    Delete a configuration container
  connect-node
    Reconnect to a node(s)
  console
    Retrieves console output of a build.
  copy-job
    Copies a job.
  create-controlled-slaves-request
    Generates a request key for controlled slaves
  create-credentials-by-xml
    Create Credential by XML
  create-credentials-domain-by-xml
    Create Credentials Domain by XML
  create-group
    Creates a groups
  create-job
    Creates a new job by reading stdin as a configuration XML file.
  create-node
    Creates a new node by reading stdin as a XML configuration.
  create-view
    Creates a new view by reading stdin as a XML configuration.
  delete-builds
    Deletes build record(s).
  delete-controlled-slave
    Remove a controlled slave from the folder
  delete-credentials
    Delete a Credential
  delete-credentials-domain
    Delete a Credentials Domain
  delete-group
    Deletes a groups
  delete-job
    Deletes job(s).
  delete-node
    Deletes node(s)
  delete-token
    Remove a token and all associated folders from the list of allowed folders
  delete-view
    Deletes view(s).
  disable-job
    Disables a job.
  disable-slave-trader
    Disables a Shared Cloud/Shared Agent for sharing
  disconnect-node
    Disconnects from a node.
  enable-job
    Enables a job.
  enable-plugin
    Enables one or more installed plugins transitively.
  enable-slave-trader
    Enables a Shared Cloud/Shared Agent for sharing
  export-configuration
    Export jenkins configuration as YAML
  get-credentials-as-xml
    Get a Credentials as XML (secrets redacted)
  get-credentials-domain-as-xml
    Get a Credentials Domain as XML
  get-job
    Dumps the job definition XML to stdout.
  get-node
    Dumps the node definition XML to stdout.
  get-view
    Dumps the view definition XML to stdout.
  groovy
    Executes the specified Groovy script.
  groovysh
    Runs an interactive groovy shell.
  group-membership
    Displays or sets the membership of a group.
  group-role-assignments
    Displays or sets group role assignments.
  help
    Lists all the available commands or a detailed description of single command.
  import-credentials-as-xml
    Import credentials as XML. The output of "list-credentials-as-xml" can be used as input here as is, the only needed change is to set the actual Secrets which are redacted in the output.
  install-plugin
    Installs a plugin either from a file, an URL, or from update center.
  install-tool
    Performs automatic tool installation, and print its location to stdout. Can be only called from inside a build. [deprecated]
  keep-build
    Mark the build to keep the build forever.
  list-alert-conditions
    Lists the alert conditions and their statuses.
  list-changes
    Dumps the changelog for the specified build(s).
  list-credentials
    Lists the Credentials in a specific Store
  list-credentials-as-xml
    Export credentials as XML. The output of this command can be used as input for "import-credentials-as-xml" as is, the only needed change is to set the actual Secrets which are redacted in the output.
  list-credentials-context-resolvers
    List Credentials Context Resolvers
  list-credentials-providers
    List Credentials Providers
  list-groups
    Lists groups.
  list-jobs
    Lists all jobs in a specific view or item group.
  list-leases
    Lists the active leases of the specified agent trader.
  list-maintenance-windows
    Lists all the scheduled maintenance windows. Alerts will be suppressed during these scheduled times.
  list-masters
    Lists masters connected to this Operations Center
  list-plugins
    Outputs a list of installed plugins.
  list-plugins-v2
    List plugins either in plain text or JSON format
  login
    Saves the current credentials to allow future commands to run without explicit credential information. [deprecated]
  logout
    Deletes the credentials stored with the login command. [deprecated]
  mail
    Reads stdin and sends that out as an e-mail.
  managed-master-cancel-provisioning
    Cancels the currently requested provisioning of a Managed Master
  managed-master-cancel-quiet-down
    Cancels a non-forced stop request of a Managed Master
  managed-master-deprovision
    Deprovisions a Managed Master
  managed-master-provision
    Provisions a Managed Master
  managed-master-provision-and-start
    Provisions and starts a Managed Master
  managed-master-reprovision
    Reprovisions a Managed Master
  managed-master-restart
    Restarts a Managed Master
  managed-master-start
    Starts a Managed Master
  managed-master-stop
    Stops running a Managed Master
  managed-master-stop-and-deprovision
    Stops and deprovisions a Managed Master
  mute-alert-condition
    Mutes the specified alert condition.
  offline-node
    Stop using a node for performing builds temporarily, until the next "online-node" command.
  online-node
    Resume using a node for performing builds, to cancel out the earlier "offline-node" command.
  plugin-catalog
    Plugin Catalog Management
  quiet-down
    Quiet down Jenkins, in preparation for a restart. Don’t start any builds.
  reload-configuration
    Discard all the loaded data in memory and reload everything from file system. Useful when you modified config files directly on disk.
  reload-jcasc-configuration
    Reload JCasC YAML configuration
  reload-job
    Reload job(s)
  remove-job-from-view
    Removes jobs from view.
  restart
    Restart Jenkins.
  safe-restart
    Safely restart Jenkins.
  safe-shutdown
    Puts Jenkins into the quiet mode, wait for existing builds to be completed, and then shut down Jenkins.
  schedule-maintenance-window
    Schedules a maintenance window. Alerts will be suppressed during this time.
  session-id
    Outputs the session ID, which changes every time Jenkins restarts.
  set-build-description
    Sets the description of a build.
  set-build-display-name
    Sets the displayName of a build.
  set-build-parameter
    Update/set the build parameter of the current build in progress. [deprecated]
  set-build-result
    Sets the result of the current build. Works only if invoked from within a build. [deprecated]
  shared-cloud-delete
    Delete a shared cloud
  shared-cloud-force-release
    Force the release of a lease
  shared-slave-delete
    Delete a shared agent
  shared-slave-force-release
    Force the release of a lease of a shared agent
  shutdown
    Immediately shuts down Jenkins server.
  support
    Generates a diagnostic support bundle.
  unmute-alert-condition
    Unmutes the specified alert condition.
  update-credentials-by-xml
    Update Credentials by XML
  update-credentials-domain-by-xml
    Update Credentials Domain by XML
  update-job
    Updates the job definition XML from stdin. The opposite of the get-job command.
  update-node
    Updates the node definition XML from stdin. The opposite of the get-node command.
  update-view
    Updates the view definition XML from stdin. The opposite of the get-view command.
  version
    Outputs the current version.
  wait-node-offline
    Wait for a node to become offline.
  wait-node-online
    Wait for a node to become online.
  who-am-i
    Reports your credential and permissions.