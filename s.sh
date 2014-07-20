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

  mv lesson-plan/.gitignore .
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
      prompt $message $key
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

echo "Initialize a github repository?"

prompt "Enter git email (q to quit)" "email"
prompt "Enter git name" "name"

printf 'Configurating git with "%s" and "%s"...\n\n' "${config["email"]}", "${config["name"]}"

git config --global user.email "${config["email"]}"
git config --global user.name "${config["name"]}"

git init

printf "\nYou now need to pair your workspace repository with your github repository.\n"
printf "Copy the URL for your repo, example: https://github.com/my-github-user/my-github-repository.git\n\n"

prompt "Paste-in the URL to your github repository" "repo"

git remote add origin "${config["repo"]}"

printf "==============================================================\n\n"

printf 'A git repository was initialized with "%s" and "%s"...\n\n' "${config["email"]}", "${config["name"]}"

printf "You will still need to do:\n\n"

printf "\t1. git add . \n"
printf "\t   ...or to add files individually, i.e., say you change only the README.md file:\n"
printf "\t1. git add README.md \n"
printf "\t2. git commit -m \"first commit\"\n"
printf "\t3. git push -u origin master\n\n"

printf "You will follow the above 3 steps to work on your lesson plan, happy teaching!\n\n"

printf "==============================================================\n"

