# My dotfiles

Inspired by other excellent dotfiles projects around the world wide web.

## Setup

Open terminal and run this command

`bash <(curl -S https://raw.githubusercontent.com/danielcorreia/dotfiles/refs/heads/master/bootstrap)`

## Private exports

The following environment variables are set by `config/exports.zsh`:

| Variable | Value | Purpose |
|---|---|---|
| `PATH` | `$HOME/personal/bin:$PATH` | Prepends personal bin tools |
| `EDITOR` | `nvim` | Default editor |
| `XDG_CONFIG_HOME` | `$HOME/.config` | XDG config directory |
| `HUSKY` | `0` | Disables Husky git hooks locally |
| `LANG` / `LC_ALL` | `en_GB.UTF-8` | Locale |
| `NODE_REPL_HISTORY_FILE` | `~/.node_history` | Persistent node REPL history |
| `NODE_REPL_HISTORY_SIZE` | `32768` | Node REPL history size |
| `GREP_OPTIONS` | `--color=auto` | Always coloured grep output |
| `LESS` | `-iXFR` | Case-insensitive, no clear on exit, colour-aware |

---

Daniel Correia
