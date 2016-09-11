#!/bin/bash

set -e

filter=$1

function main {
  for commit in `commits`; do 
    description  
    line_count
  done
}

function commits {
  git rev-list --reverse HEAD
}

function description {
  git log --oneline -1 $commit;
}

function line_count {
  git ls-tree -r $commit | 
  grep "$filter" |
  awk {'print $3'} | 
  xargs git show | 
  wc -l; 
}

main