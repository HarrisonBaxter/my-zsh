#!/bin/sh
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

PROJECTS_DIR=/dbox/projects

for project in `ls $PROJECTS_DIR`
do
  eval "alias goto_${project}='cd $PROJECTS_DIR/$project'"
done

alias goto_downloads='cd ~/Downloads'
alias goto_projects='cd $PROJECTS_DIR'
alias p='cd $PROJECTS_DIR'
alias goto_dbox='cd /dbox'
alias goto_android-sdk='cd ~/Android/Sdk'
