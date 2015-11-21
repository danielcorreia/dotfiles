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
    total = len(DOTFILES)

    for index, dotfile in enumerate(DOTFILES):
        dest = os.path.join(home_dir, dotfile)

        shutil.copy(dotfile, dest)

    print("Copied dotfiles to {}".format(home_dir))


def setup_vundle():
    # FIXME: this creates a folder in this directory called "~"
    subprocess.call(
        "git clone https://github.com/VundleVim/Vundle.vim.git "
        "~/.vim/bundle/Vundle.vim".split(' ')
    )


def install_virtualenvwrapper():
    subprocess.call("pip install virtualenvwrapper".split(' '))


def main():
    home_dir = os.path.expanduser('~')
    bootstrap_dotfiles(home_dir)
    install_virtualenvwrapper()
    # setup_vundle()
    subprocess.call("pip install --upgrade pip setuptools".split(' '))
    subprocess.call("pip3 install --upgrade pip setuptools".split(' '))


if __name__ == '__main__':
    main()
