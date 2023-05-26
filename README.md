# root > f5.sh

![release-date](https://badgen.net/badge/release-date/Jun%2022,%202022/red?icon=bitcoin-lightning)
![daily-queries](https://badgen.net/badge/daily-queries/699+/red?icon=github)

script, that helps you to install your node in one line.
list of available nodes see [here](https://github.com/f5nodes).

## usage

```sh
. <(wget -qO- sh.f5nodes.com) [name] [-y]
```

arguments:

- **[name] \*** - name of node you want to install
- **[-y]** - automatic yes to prompt; skip confirmation.

## example

```sh
. <(wget -qO- sh.f5nodes.com) subspace -y
```

will install **Subspace** node.

## links

[f5nodes.com](https://f5nodes.com)
