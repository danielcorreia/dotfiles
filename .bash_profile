export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load the shell dotfiles, and then some:
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

PATH=$PATH:/usr/local/bin:/usr/local/sbin:/Applications/Postgres.app/Contents/Versions/9.3/bin

export WORKON_HOME=$HOME/.envs
source "/usr/bin/virtualenvwrapper.sh"

# Autocorrect typos in path names when using 'cd'
shopt -s cdspell;
# Case insensitive globbing
shopt -s nocaseglob;
# Append to Bash history file, rather than overwriting it
shopt -s histappend;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# Git auto complete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export PYTHONSTARTUP="$HOME/.pythonrc"

# Add Go path
export GOPATH="$HOME/code/go"
PATH=$PATH:$GOPATH/bin

# Git update
export PATH="/usr/local/git/bin:$PATH"
export PATH


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
