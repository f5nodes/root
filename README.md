# root > f5.sh

script, that helps you to install your node in one line.  
list of available nodes see [here](https://github.com/f5nodes).

## usage

```sh
. <(wget -qO- sh.f5nodes.com) [name] [language]
```

arguments:

-  **[name] \*** - name of node you want to install
-  **[language]** - language of node script interface (_**en** by default_)

## example

```sh
. <(wget -qO- sh.f5nodes.com) subspace uk
```

will install **Subspace** node using **ukrainian** language.

## links

[f5nodes.com](https://f5nodes.com)
