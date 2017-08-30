#!/bin/bash

config_path=$1

while read line; do    
  path=`echo $line | cut -d \, -f 1`
  remote=`echo $line | cut -d \, -f 2`
  branch=`echo $line | cut -d \, -f 3`
  
  cd $path;

  current_branch=`git branch | grep "*" | cut -d \* -f 2 | awk '{print $1}'`

  git stash; git checkout $branch; git fetch $remote; 
  git merge $remote/$branch; git push origin $branch; 
  git checkout $current_branch; git stash pop;
done < $config_path
