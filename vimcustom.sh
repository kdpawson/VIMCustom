#!/bin/bash
#This file was created by Keith Pawson on Tue May 06 2014
# contact kdpawson@gmail.com
# Version 1.1 : 21 July 2014 : --> Added vim-puppet
# Version 1.2 : 28 July 2014 : --> Added tabular
# Version 1.3 : 20 August 2014 : --> Fixed incorrect syntax errors

echo ''
echo -e '\033[33m\033[33m'
echo ' /_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_'
echo '|                    Vim customiser script                               |'
echo '|                                                                        |'
echo '|This script will customise VIM by installing some useful plugins        |'
echo '|and create some useful .vimrc entries.                                  |'
echo '|                                                                        |'
echo '|                                     By Keith Pawson kdpawson@gmail.com |'
echo '|                                                                        |'
echo '|/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_|'
sleep 2
echo ''
read -p '		<<< Press [Enter] Key To Start >>>'
sleep 1

echo  '<<< Update system and install VIM and git for plugins >>>'
sleep 2

# UPDATE SOURCES & SYSTEM UPGRADE
echo '<<<-------Select OS System------>>>'
sleep 2
echo -e "\033[0m"
PS3="Please Select Your OS System:"
LIST="Ubuntu Centos Quit"
select i in $LIST
        do
        if  [ "$i" = "Ubuntu" ]
        then
                sudo apt-get update -y; sudo apt-get upgrade -y;
        elif [ "$i" = "Centos" ]
        then
              sudo yum update -y;
        elif [ "$i" = "Quit" ]
     then
exit
     fi
echo -e '\033[33m<<<------System Update Complete------>>>\033[33m'

# INSTALLING VIM, Curl, wget and git Packages
echo -e '\033[33m<<<------Installing VIM git and curl------>>>\033[33m'
echo -e "\033[0m"
sleep 2
PS3="Please select your OS System:"
LIST="Ubuntu Centos Quit"
select i in $LIST
        do
        if  [ "$i" = "Ubuntu" ]
        then
                sudo apt-get install -y vim git git-core curl wget;
        elif [ "$i" = "Centos" ]
        then
              sudo yum install vim git git-core curl wget -y;
        elif [ "$i" = "Quit" ]
     then
exit
     fi

# Install pathogen vim plugin
echo -e '\033[33m<<<------Installing Pathogen--->>>\033[33m'
sleep 2
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
wget https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim -O ~/.vim/autoload/pathogen.vim

# Installing Syntastic
echo -e '\033[33m<<<------Installing Syntastic------>>>\033[33m'
echo -e "\033[0m"
sleep 2
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git
cd \

# Install vim-airline
echo -e '\033[33m<<<------Install vim-airline------>>>\033[33m'
sleep 2
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
sleep 2

# Install vim-puppet for puppet syntax
echo -e '\033[33m<<<------Install vim-puppet------>>>\033[33m'
sleep 2
git clone https://github.com/rodjek/vim-puppet.git ~/.vim/bundle/vim-puppet
sleep 2

# Install tabular for puppet syntax
echo -e '\033[33m<<<------Install tabular------>>>\033[33m'
sleep 2
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
sleep 2

# modify .vimrc file
echo -e '\033[33m<<<------modify .vimrc file------>>>\033[33m'
touch ~/.vimrc
echo 'syntax on
set number
execute pathogen#infect()
set laststatus=2
set t_Co=256
filetype indent plugin on
set expandtab
set smarttab
set autoindent
map <F2> i#!/bin/bash <ESC>
map <F3> o#This file was created by Keith Pawson kdpawson@gmail.com on <ESC>:r!date "+\%a \%b \%d \%Y"<ESC>kJ' > .vimrc
clear

echo '<<<------All Finished Check .vimrc and vim functions------>>>'
echo -e "\033[0m"
sleep 4
exit $?
done
done
