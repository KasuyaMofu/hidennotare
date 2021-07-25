#!/bin/bash

DEFAULT_BRANCH=main

function select-branch(){
  git branch -r | awk '
    {
      gsub(/[ \t]/,"", $0);
      gsub(/.*->/,"", $0);
      ln[NR]=$0;print NR") " $0
    }END{
      print "------"; 
      getline n < "/dev/tty";
      if(ln[n]==""){print "invalid"; exit}
      gsub(/[ \t]/,"", ln[n]);
      system("echo \""ln[n]"\"> ./branch.tmp;")
    }';
}  

function check-git-setting(){
  local FAULT=0;
  git config user.name  > /dev/null || { echo "please set \"git config --global user.name\"" ; FAULT=1; }
  git config user.email > /dev/null || { echo "please set \"git config --global user.email\""; FAULT=1; }
  if [ $FAULT -eq 1 ];then
    exit;
  fi
}

check-git-setting

git fetch

select-branch

if [ ! -f ./branch.tmp ]; then
  exit;
fi

echo -n "you selected: "
cat ./branch.tmp
echo "-----"

SELECTED_BRANCH=`cat ./branch.tmp`
rm ./branch.tmp
git -c advice.detachedHead=false -c status.AheadBehind=false -c branch.autoSetupRebase=always checkout $SELECTED_BRANCH
git log --oneline -3
