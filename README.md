# My dotfiles

Inspired by other excellent dotfiles projects around the world wide web.

## Setup

Open terminal and run this command

`bash <(curl -S https://raw.githubusercontent.com/danielcorreia/dotfiles/refs/heads/master/bootstrap)`

## Environment variables

Exported by `config/exports.zsh`:

| Variable | Value | Purpose |
|---|---|---|
| `PATH` | `$HOME/personal/bin:$PATH` | Prepends personal bin directory to PATH |
| `EDITOR` | `nvim` | Default editor |
| `XDG_CONFIG_HOME` | `$HOME/.config` | User-specific configuration directory |
| `HUSKY` | `0` | Disables Husky git hooks locally |
| `LANG` | `en_GB.UTF-8` | System locale |
| `LC_ALL` | `en_GB.UTF-8` | Overrides all locale categories |
| `NODE_REPL_HISTORY_FILE` | `~/.node_history` | Persistent Node.js REPL history file |
| `NODE_REPL_HISTORY_SIZE` | `32768` | Maximum Node.js REPL history entries |
| `GREP_OPTIONS` | `--color=auto` | Always enable coloured grep output |
| `LESS` | `-iXFR` | Less pager options (case-insensitive, no clear on exit, quit if one screen, raw colours) |

---

Daniel Correia
