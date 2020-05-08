#!/bin/env bash

# First thing we do is obtain a crumb from cjoc, this allows us to call the rest API without having to disable CSRF.
JENKINS_CRUMB=$( \
  curl --user $USERNAME:$PASSWORD \
       --silent "$URL/cjoc/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)" \
)

# Get the JSON payload from the generateNewToken API
JENKINS_TOKENS_JSON=$( \
  curl --header "$JENKINS_CRUMB" \
       --user $USERNAME:$PASSWORD \
       --silent "$URL/cjoc/user/$USERNAME/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken" \
       --data "newTokenName=$USERNAME" \
)

# Pulls the token out of the JSON payload.
JENKINS_TOKEN=$( \
  echo $JENKINS_TOKENS_JSON | jq '.data.tokenValue' \
)

# Running Sed to get trim quotes from the output and returns it.
sed -e 's/^"//' -e 's/"$//' <<<"$JENKINS_TOKEN"