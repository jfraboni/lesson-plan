#!/usr/bin/env bash

echo "executing lesson set up..."

if [[ `hostname -s` = "runnable" ]]
then
  echo "...on runnable..."

  if [ -e "package.json" ]
	then
	  echo "removing original package.json"
	  rm package.json
  fi
  if [ -e "server.js" ]
	then
	  echo "removing original server.js"
	  rm server.js
  fi

  mv lesson-plan/* .
  rm -rf lesson-plan

  echo "Files relocated to root, installing node packages..."
  cd master && npm install
  
  cd ..
  rm s.sh
else
  cd master && npm install
  
  cd ..
  rm s.sh
fi

git init
git add .
