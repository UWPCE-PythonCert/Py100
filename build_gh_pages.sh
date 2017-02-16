#!/bin/sh

# simple script to build and push to gh-pages
# designed to be run from master

git checkout gh-pages
make html
git add *
git commit -a -m "Updating presentation materials"
git pull -s ours --no-edit
git push
