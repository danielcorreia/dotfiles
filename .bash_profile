export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add python startup script
export PYTHONSTARTUP="$HOME/.pythonrc"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

PATH=$PATH:/usr/local/bin:/usr/local/sbin:/Applications/Postgres.app/Contents/Versions/9.3/bin
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

export WORKON_HOME=$HOME/.envs
source "/usr/bin/virtualenvwrapper.sh"

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Git completion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

export PYTHONSTARTUP="$HOME/.pythonrc"

# Add Go path
export GOPATH="$HOME/code/go"
PATH=$PATH:$GOPATH/bin

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Git update
export PATH="/usr/local/git/bin:$PATH"
export PATH

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
