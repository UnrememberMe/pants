#!/usr/bin/env bash

# This script acts to push all changes that hit pantsbuild/pants master
# to a ~mirror at pantsbuild/pants-for-travis-osx-ci.  Only the active
# .travis.yml is changed.  This is all done to support CI runs against OSX.
# Although Travis-CI has support for an os list in the main .travis.yml,
# 'osx' is currently at capacity and not accepting new users.
# CIs can be run against OSX still, but for this the .travis.yml must specify
# a language of objective-c.  Since there can be only 1 .travis.yml per
# repo, we're forced to maintain a mirror repo.
#
# See .travis.osx.yml at the root of this repo for more information.

# Only sync pantsbuild/pants-for-travis-osx-ci on pushes to pantsbuild/pants master
# and only do this for 1 CI job in the build matrix.

# The secured GH_* env vars will only be set for the pantsbuild/pants repo and
# not for its forks, see:
#  http://docs.travis-ci.com/user/pull-requests/#Security-Restrictions-when-testing-Pull-Requests
if [[ -z ${GH_TOKEN} ]]
then
  echo "Not syncing OSX CI for fork of pantsbuild/pants."
  exit 0
fi

# See this env var reference:
#  http://docs.travis-ci.com/user/ci-environment/#Environment-variables
if [[ "${TRAVIS_BRANCH}" != "master" ]]
then
  echo "Not syncing OSX CI for branch ${TRAVIS_BRANCH}."
  exit 0
fi

# Iff there is an associated pull request, we'll have an env var like:
#   TRAVIS_PULL_REQUEST=123
if (( ${TRAVIS_PULL_REQUEST:-0} > 0 ))
then
  echo "Not syncing OSX CI for pull request ${TRAVIS_PULL_REQUEST}."
  exit 0
fi

if [[ "${TRAVIS_BUILD_NUMBER}" != "${TRAVIS_JOB_NUMBER}" && \
      "${TRAVIS_JOB_NUMBER/${TRAVIS_BUILD_NUMBER}./}" != "1" ]]
then
  echo "Not syncing OSX CI for auxillary CI job ${TRAVIS_JOB_NUMBER}."
  exit 0
fi

echo "Syncing OSX CI to $(git rev-parse HEAD) for CI build ${TRAVIS_BUILD_NUMBER}." && \
cp .travis.osx.yml .travis.yml && \
GIT_AUTHOR_NAME="${GH_USER}" GIT_AUTHOR_EMAIL=${GH_EMAIL} \
  git commit -am "Prepare pants OSX mirror for CI." && \
git config credential.helper "store --file=.git/credentials" && \
echo "https://${GH_TOKEN}:@github.com" > .git/credentials && \
git push -f https://github.com/pantsbuild/pants-for-travis-osx-ci.git HEAD:master

