#!/bin/bash

set -e -o pipefail

function releaseRuleSet() {
    dirName=$1
    pushd $dirName
    git init
    git config --local user.name "github-actions[bot]"
    git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git remote add origin https://github-action:$GITHUB_TOKEN@github.com/daiyeqi/sing-rules.git
    git branch -M $dirName
    git add .
    git commit -m "Update rule-set"
    git push -f origin $dirName
    popd
}

releaseRuleSet rule-set
releaseRuleSet rule-set-unstable
