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

HOME_DIR = os.path.expanduser('~')


def question(sentence, options=None, defaults=None):
    if options:
        options_str = " [{}]".format('/'.join(options))

    complete_question = '{question}{options}'.format(sentence, options_str)
    answer = raw_input(complete_question)


def bootstrap_dotfiles():
    dotfiles_dir = 'dotfiles'
    for dotfile in DOTFILES:
        src = os.path.join(HOME_DIR, dotfiles_dir, dotfile)
        dest = os.path.join(HOME_DIR, dotfile)
        os.symlink(src, dest)

    print("Created symbolic links for dotfiles in `{}`".format(HOME_DIR))


def brew_install():
    subprocess.call("brew_install.sh")


def setup_vundle():
    subprocess.call("mkdir -p {}".format(os.path.join(HOME_DIR, ".vim/bundle/")), shell=True)
    subprocess.call([
        "git clone https://github.com/VundleVim/Vundle.vim.git",
        os.path.join(HOME_DIR, ".vim/bundle/Vundle.vim")
    ])


def setup_git_commit_msg():
    subprocess.call(
        "curl https://cdn.rawgit.com/danielcorreia/"
        "9cac3cdd66563109156bd4243c7bc4e2/raw/d1c26da58b5859c7e66a93631c847b850bee2386/git_commit_msg.txt"
        ">> ~/.git_commit_msg.txt",
        shell=True
    )
    subprocess.call(
        "git config --global commit.template ~/.git_commit_msg.txt",
        shell=True
    )


def main():
    bootstrap_dotfiles()
    # order matters here
    # brew must run before setup_vundle so that cmake is installed
    # (required for YouCompleteMe compilation)
    brew_install()
    setup_vundle()
    setup_git_commit_msg()

if __name__ == '__main__':
    main()
