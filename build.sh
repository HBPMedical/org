#!/usr/bin/env bash
set -e

cat resources/config.edn.tmpl | sed -e "s/GITHUB_TOKEN/$GITHUB_TOKEN/" > resources/config.edn

lein run
