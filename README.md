# vscode-langservers-extracted

HTML/CSS/JSON/ESLint language servers extracted from [vscode](https://github.com/Microsoft/vscode).

# Why?

- Microsoft provided awesome Language Servers for the community but stopped shipping updated stand-alone npm packages for them.

# Usage

Install npm packages for the server(s) you need:

- `npm install -g vscode-css-language-server`
- `npm install -g vscode-eslint-language-server`
- `npm install -g vscode-html-language-server`
- `npm install -g vscode-json-language-server`

Or you can install all four with `npm i -g vscode-langservers-extracted`.

OR

in the aur via `yay -S vscode-langservers-extracted`

After that, you get the following commands.

- `vscode-html-language-server`
- `vscode-css-language-server`
- `vscode-json-language-server`
- `vscode-eslint-language-server`


# Build

> [!NOTE]
> This package was previously built with yarn (because VSCode was built using yarn).
> VSCode has switched to vanilla npm so similarly we no longer use yarn to build.

## Setup

```
git clone https://github.com/hrsh7th/vscode-langservers-extracted
git submodule init
git submodule update
```

## Install locally:

```
npm install
```

## Update

The upstream directory contains git submodules for:

- [vscode](https://github.com/microsoft/vscode) ([release tags](https://github.com/microsoft/vscode/tags))
- [vscode-eslint](https://github.com/microsoft/vscode-eslint/) ([release tags](https://github.com/microsoft/vscode-eslint/tags))

For example, to update to vscode `1.93.1` and vscode-eslint `release/3.0.10`:

```
pushd upstream/vscode
git fetch
git checkout 1.93.1
popd

pushd upstream/vscode-eslint
git fetch
git checkout release/3.0.10
popd

./update.sh
```

### Release

```bash
npm run depcheck
npm run fix
# npm run release
```

# LICENSE

- [Package License](./LICENSE) (MIT)
- [VSCode License](https://github.com/microsoft/vscode/blob/main/LICENSE.txt) (MIT)
- [VSCode Eslint License](https://github.com/microsoft/vscode-eslint/blob/master/License.txt) (MIT)
