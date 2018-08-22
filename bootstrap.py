#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import shutil
from subprocess import call

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

def setup_vim_themes():
    '''Setup vim themes

    Download themes and move them to the vim directory
    '''
    call(
        "curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim "
        ">> solarized.vim",
        shell=True
    )
    vim_dir = os.path.join(HOME_DIR, ".vim/colors/")
    call("mkdir -p {}".format(vim_dir), shell=True)
    call("mv solarized.vim {}".format(vim_dir), shell=True)
    print("Copied solarized.vim")


def personal_folders():
    folders = [
        'code/bin',
    ]
    for folder in folders:
        folder_dir = os.path.join(HOME_DIR, folder)
        call("mkdir -p {}".format(folder_dir), shell=True)
    print("Created personal folders")


def brew_install():
    call("brew_install.sh")


def setup_vundle():
    vundle_dir = os.path.join(HOME_DIR, ".vim/bundle/Vundle.vim/")
    call("mkdir -p {}".format(vundle_dir), shell=True)
    call(
        "git clone https://github.com/VundleVim/Vundle.vim.git {}".format(vundle_dir),
        shell=True
    )
    call("vim +PluginInstall +qall", shell=True)
    print("Vundle installed")


def setup_git_commit_msg():
    call(
        "curl https://cdn.rawgit.com/danielcorreia/"
        "9cac3cdd66563109156bd4243c7bc4e2/raw/d1c26da58b5859c7e66a93631c847b850bee2386/git_commit_msg.txt"
        ">> ~/.git_commit_msg.txt",
        shell=True
    )
    call(
        "git config --global commit.template ~/.git_commit_msg.txt",
        shell=True
    )


def setup_iterm_themes():
    '''Download iterm themes'''
    call(
        "curl https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors "
        ">> SolarizedDark.itermcolors",
        shell=True
    )
    call(
        "curl https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors "
        ">> SolarizedLight.itermcolors",
        shell=True
    )


def main():
    personal_folders()
    bootstrap_dotfiles()
    setup_vim_themes()
    # order matters here
    # brew must run before setup_vundle so that cmake is installed
    # (required for YouCompleteMe compilation)
    brew_install()
    setup_vundle()
    setup_git_commit_msg()
    setup_iterm_themes()

if __name__ == '__main__':
    main()
