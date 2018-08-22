#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import shutil
import subprocess

commands = {
    'ssh_key': "ssh-keygen -t rsa -b 4096 -C '{email}'"
}

DOTFILES = [
    '.aliases',
    '.bash_profile',
    '.bash_prompt',
    '.exports',
    '.functions',
    '.gitconfig',
    '.gitignore',
    '.hushlogin',
    '.inputrc',
    '.pythonrc',
    '.tmux.conf',
    '.vimrc',
]


def question(sentence, options=None, defaults=None):
    if options:
        options_str = " [{}]".format('/'.join(options))

    complete_question = '{question}{options}'.format(sentence, options_str)
    answer = raw_input(complete_question)


def bootstrap_dotfiles(home_dir):
    for dotfile in DOTFILES:
        dest = os.path.join(home_dir, dotfile)
        os.symlink(dotfile, dest)

    print("Created symbolic links for dotfiles in `{}`".format(home_dir))


def setup_vundle():
    # FIXME: this creates a folder in this directory called "~"
    subprocess.call(
        "git clone https://github.com/VundleVim/Vundle.vim.git "
        "~/.vim/bundle/Vundle.vim".split(' ')
    )


def setup_git_commit_msg():
    subprocess.call("http https://cdn.rawgit.com/danielcorreia/9cac3cdd66563109156bd4243c7bc4e2/raw/d1c26da58b5859c7e66a93631c847b850bee2386/git_commit_msg.txt >> ~/.git_commit_msg.txt")
    subprocess.call("git config --global commit.template ~/.git_commit_msg.txt")


def main():
    home_dir = os.path.expanduser('~')
    bootstrap_dotfiles(home_dir)
    # TODO
    # setup_vundle()
    # setup_git_commit_msg()

if __name__ == '__main__':
    main()
