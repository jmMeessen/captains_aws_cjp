curl --silent --location https://updates.jenkins-ci.org/current/update-center.actual.json | jq -r '.plugins[] | .gav'
