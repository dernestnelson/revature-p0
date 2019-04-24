### setting up a new git repository structure for node application ###

#!/bin/bash

## verify git/node
if ! [ -n $(which git) ] && ! [ -n $(which node) ]; then
echo "Either git or node (or both) is not installed"
exit 1
fi

## checks if directory is empty
dir=$1

if ! [ -d $dir ]; then   ##makes the directory if not there
mkdir $dir
echo "made the directory"
fi

if [ -z "$(ls -A $dir)" ]; then
   echo "empty directory"
else
   echo "directory is not empty"
   exit 1
fi

## directory creation
    mkdir $dir/.docker

    touch \
    $dir/.docker/dockerfile \
    $dir/.docker/dockerup.yaml

    ## github
    mkdir -p \
    $dir/.github/ISSUE_TEMPLATE \
    $dir/.github/PULL_REQUEST_TEMPLATE

    touch \
    $dir/.github/ISSUE_TEMPLATE/issue-template.md \
    $dir/.github/PULL_REQUEST_TEMPLATE/pull-request-template.md

    touch \
    $dir/.github/CODE-OF-CONDUCT.md \
    $dir/.github/CONTRIBUTING.md

    ## root
    mkdir \
    $dir/client \
    $dir/src \
    $dir/test

    touch \
    $dir/client/.gitkeep \
    $dir/src/.gitkeep \
    $dir/test/.gitkeep

    touch \
    $dir/.azureup.yaml \
    $dir/.dockerignore \
    $dir/.editorconfig \
    $dir/.gitignore \
    $dir/.markdownlint.yaml \
    $dir/CHANGELOG.md \
    $dir/LICENSE.txt \
    $dir/README.md


# enforce node as project runtime
# creates a package.json
npm init -y

## convert to git repository and initialize git
user=$2
userEmail=$3

git init
git config $user
git config $userEmail

exit 0
