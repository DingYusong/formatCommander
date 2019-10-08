#!/usr/bin/env bash
#Copyright (c) 2018 DingYusong

oldpwd=`pwd`

if [ ! -d ~/tools ]; then
    echo "create tools folder under $HOME"
    cd ~ && mkdir tools
fi

if [ ! -d ~/tools/spacecommander ]; then
	cd ~/tools
    echo "download spacecommander to $HOME/tools"
    git clone https://github.com/DingYusong/spacecommander.git    
fi

if [ `grep -c "SPACECOMMANDER" ~/.zshrc` -eq '0' ]; then
    echo "add to .zshrc"
	echo "export SPACECOMMANDER=~/tools/spacecommander" >> ~/.zshrc
fi

source ~/.zshrc

cd $oldpwd

if [[ ! -e .gitignore ]]; then
	curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore
fi

$SPACECOMMANDER/setup-repo.sh

curl -o .clang-format https://raw.githubusercontent.com/DingYusong/formatCommander/master/.clang-format

