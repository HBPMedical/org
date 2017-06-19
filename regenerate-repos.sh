#!/usr/bin/env bash

curl -H "Authorization: bearer $GITHUB_TOKEN" -X POST \
  -d "{\"query\": \"query { organization(login: \\\"HBPMedical\\\") {repositories(last: 100) {nodes {name }}}}\"}" \
  https://api.github.com/graphql | \
    jq ".data.organization.repositories.nodes[].name" | \
    grep -i -v "\"(HBPSP8Repo.github.io|Study-WebApps|WebMIPMap_old)\"" | \
    sort
