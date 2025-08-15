#!/bin/bash

set -e -o pipefail

mkdir -p release
cd release
git init
git config --local user.name "github-actions[bot]"
git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
git remote add origin https://github-action:$GITHUB_TOKEN@github.com/daiyeqi/sing-rules.git
git branch -M release
cp ../*.db ../*.sha256sum .
git add .
git commit -m "Update release"
git push -f origin release
