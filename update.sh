#!/bin/sh

set -euo pipefail

if [ "$(node -v | sed 's/^v//' | cut -d. -f1)" -lt 20 ]; then
    echo "Node.js version must be 20.0.0 or greater" && exit 1
fi

for lang in css eslint html json; do
    rm -rf packages/${lang}/dist
    mkdir -p packages/${lang}/dist
    cp templates/cli.js packages/${lang}/bin/vscode-${lang}-language-server
done

# Extensions extracted from vscode repo
pushd upstream/vscode
    git clean -d -x -f
    npm install
    npm run compile
    for lang in css html json; do
        cp -r extensions/${lang}-language-features/server/out/* ../../packages/${lang}/dist/
    done
popd

# Eslint extension
pushd upstream/vscode-eslint
    npm install
    npm run compile
    cp -r server/out/* ../../packages/eslint/dist
popd

# Cleanup excess cruft
find packages/*/dist -name "*.map" -type f -delete
rm -rf packages/*/dist/browser
rm -rf packages/*/dist/test

npm run check
npm run depcheck

# TODO: Match vscode/vscode-eslint dependency versions
