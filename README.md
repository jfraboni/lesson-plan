# READ THIS FIRST

## Preliminary Setup Steps:

Please follow these next steps to setup your lesson plan in your workspace, either on runnable.com or locally.  Once you're finished with the setup, you should delete these steps from this READM.md file, as it will serve as your lesson plan.  In other words, delete everything in the README.md file above **My Lesson**, then edit the lesson plan to reflect your lesson.

### Setup

0. Set up your own github.com repository for your lesson by logging into your github account, selecting the `+` menu option at the top right side of the page, then selecting `New repository`.  Follow the steps by giving your repo a name and description - something to reflect the point of your lesson - leave the other defaults, and then click `Create repository`...

    On the next page, you find at the top of the page a yellow box that says **Quick setup** with a textbox that holds the URL to your newly created repository.  The URL will be something like: `https://github.com/my-github-user/my-awesome-lesson-plan.git`, depending on your github username and what you name your lesson repository.  Keep this page open and this URL handy, you'll need to copy/paste it in the next step. 

1. Clone this lesson-plan repository to your runnable.com workspace.  By pasting-in the following line into the command-line in your runnable.com workspace, you will be prompted for the email and username associated with your github account, _and_ for the git URL to your repository, which we mentioned in step 0.  Each step will ask you to check you've entered the info correctly, so double check your input, because these values need to be exactly correct.

    Here's the commands to paste-in and run:

        git clone https://github.com/jfraboni/lesson-plan.git && lesson-plan/s.sh

2. Next, in the **Installation** section of your lesson plan, below, change the `git clone` command to include the URL to your lesson plan on github!  For example, in the following commands:

        git clone https://github.com/myuser/my-lesson.git spark && spark/setup.sh

    You'll replace only the:

        https://github.com/myuser/my-lesson.git

    You can find that URL on your github repository, right-side of the page, find the box that says `HTTPS clone URL`

3. Use this link to learn the markdown to format your lesson:

        https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

4. Delete these 4 steps and begin to edit your lesson plan!



My Lesson
=======================
A blurb about my lesson...

# Installation

### On runnable.com:
Create a new node app, and from the terminal, enter or cut and paste the following commands, then press enter or return:
    
    git clone https://github.com/myuser/my-lesson.git spark && spark/setup.sh
    
...some text will fly by as the repository is cloned locally and the project is setup.

Great, you're set to roll!


# This is How You Format A Title

**This will format bold**

For example:

**TODO 1 :** Here, create two variables in the same statement, one named `prompt` which will hold the prompt module, and one named `fs` to hold the file-system module:

This is how you format code:
```javascript
#!/usr/bin/env node

// TODO 1 : create variables for prompt and fs by calling require in each respective module:
var 
    prompt = require("prompt"),
    fs = require("fs")
    ;
```


**Run the App** Switch to the command line, and go ahead and run the app like so:
And this is how you put a box around your text:

    # ./magic-eight-ball.js