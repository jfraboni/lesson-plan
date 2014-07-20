#!/usr/bin/env bash

declare -A config

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
else
  cd lesson-plan/master && npm install
fi

handle_input() {
    key=$1
    value=$2
    message=$3

    echo -n "$value : cool? (y/n): "
  read response

  case $response in
  "y")
    config[$key]=$value
      ;;
  "n")
      prompt $message
      ;;
  *)
      echo "Invalid input"
      handle_input $key $value $message
      ;;
  esac
}

cd ..
rm s.sh

prompt() {
  message=$1
  key=$2

  IFS= read -r -p "$message: " input

  # if user elects to quit (q), exit early
  if [[ "$input" == "q" ]]; then
    return
  fi

  # if no input, apply default, if no default re-prompt
  if [[ -z "$input" ]]; then
    input=$3
  fi
  if [[ -z "$input" ]]; then
    prompt "$message" $key
  fi
  handle_input "$key" "$input" "$message"
}

prompt "Enter git email (q to quit)" "email"
prompt "Enter git name" "name"

echo "Configurating git with $config[email] and $config[name]..."

git config --global user.email "$config[email]"
git confit --global user.name "$config[name]"

git init
git add .



