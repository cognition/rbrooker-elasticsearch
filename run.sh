#!/bin/bash


echo "check if this is a new container" 
if [[ ! -f /.UPDATED ]] 
then
  echo "this is a New deployment"
  echo "update config"
  touch /.UPDATED
else 
  echo "already updated, lets get started!"   
fi
echo ""



