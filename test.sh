#!/bin/bash

formula=go-jira

run_tests() {
  jira version
}

set -ex

if run_tests; then
  brew uninstall $formula
fi

cp $formula.rb /usr/local/Library/Formula/$formula.rb

cat /usr/local/Library/Formula/$formula.rb

if grep HEAD brew-$formula.rb; then
  brew install $formula --HEAD
else
  brew install $formula
fi

run_tests

brew uninstall $formula
