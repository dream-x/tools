#!/bin/bash

config_path=$1

while read line; do    
  path=`echo $line | cut -d, -f1`
  remote=`echo $line | cut -d, -f2`
  branch=`echo $line | cut -d, -f3`
  
  cd $path; git checkout $branch; git fetch $remote; git merge $remote/$branch; git push origin $branch
done < $config_path
