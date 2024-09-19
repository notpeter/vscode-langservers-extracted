#!/bin/bash

set -e

VSCODE_TAG="1.93.0"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# prepare
mkdir -p $DIR/../tmp
mkdir -p $DIR/../dist

# clone
cd $DIR/../tmp
git clone git@github.com:Microsoft/vscode vscode --depth=1 --branch "$VSCODE_TAG"

# pull
cd $DIR/../tmp/vscode
git clean -fd
git checkout .
git pull --rebase

# npm install
cd $DIR/../tmp/vscode
yarn
yarn compile

# copy to dist
cd $DIR/..

mkdir -p ./dist/css-language-server
cp -r ./tmp/vscode/extensions/css-language-features/server/out/* ./dist/css-language-server/
npx babel ./dist/css-language-server --out-dir ./lib/css-language-server/

mkdir -p ./dist/html-language-server
cp -r ./tmp/vscode/extensions/html-language-features/server/out/* ./dist/html-language-server/
npx babel ./dist/html-language-server --out-dir ./lib/html-language-server/

mkdir -p ./dist/json-language-server
cp -r ./tmp/vscode/extensions/json-language-features/server/out/* ./dist/json-language-server/
npx babel ./dist/json-language-server --out-dir ./lib/json-language-server/

#mkdir -p ./dist/markdown-language-server
#cp -r ./tmp/vscode/extensions/markdown-language-features/out/* ./dist/markdown-language-server/
#npx babel ./dist/markdown-language-server --out-dir ./lib/markdown-language-server/
