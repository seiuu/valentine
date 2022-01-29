#!/usr/bin/env sh

set -e

npm run build

cd dist

git init

git add -A
git commit -m 'New deployment'
git push -f https://github.com/seiuu/valentine-project.git master:gh-pages

cd -