## Neovim Configuration for Termux

This Neovim configuration works well in most cases.

## Troubleshooting

If a linter or formatter is not working, try running the following command:

```sh
$ find -L /data/data/com.termux/files/home/.local/share/nvim/mason/bin/ -type f -executable  -exec termux-fix-shebang {} \;
```

If you are using a locally installed linter or formatter, try the following command instead:

```sh
$ termux-fix-shebang node_modules/.bin/prettier
```
