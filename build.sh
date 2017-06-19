#!/usr/bin/env bash
set -e

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Please define GITHUB_TOKEN"
  exit 1
fi
cat resources/config.edn.tmpl | sed -e "s/GITHUB_TOKEN/$GITHUB_TOKEN/" > resources/config.edn

rm -rf docs/ out/
lein run
sass sass/style.scss:resources/public/css/style.css
