VIMCustom
=========

Custom VIM configuration for Linux Ubuntu/Debian or CentOS/Redhat based Distos.

 < WARNING Backup your .vimrc file before running this script >
 < You have been Warned!! >

Make the script file executable and run with root privileges, it will ask you which Distro you are running Ubuntu or CentOS. It will first run an update with apt-get update or yum update depending on what distro you entered. It will now install some pre-req packages such as VIM, git and wget and then install the following:


==> pathogen vim plugin

==> Syntastic

==> vim-airline

==> vim-puppet for puppet syntax

==>tabular for puppet syntax


The script will then modify your .vimrc file with following components:

syntax on
set number
execute pathogen#infect()
set laststatus=2
set t_Co=256
filetype indent plugin on
set expandtab
set smarttab
set autoindent
map <F2> i#!/bin/bash <ESC>
map <F3> o#This file was created by Keith Pawson kdpawson at gmail.com on <ESC>:r!date "+\%a \%b \%d \%Y"<ESC>kJ

Change the above items to suit your name and other requirements.
