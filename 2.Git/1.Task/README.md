# 1. Task - Getting started with Git (Local)


## Configure git
- To configure git with your user, type the following commands with your own name and email.

    `git config --global user.name "John Doe"`
    
    `git config --global user.email johndoe@example.com`


## Create first Git Repository

- Create Folder

    `mkdir myfirstrepo`

- Open folder

    `cd myfirstrepo`

- Initialize git

    `git init`

- Check a new .git folder has been created with content

    `ls .git`


## Create files/changes (CLI)

- Create a file with text

    `echo "initial content" > file1.txt`

- Stage changes

    `git add .`

- commit changes

    `git commit -m "My first change"`

- make a new change to the file

    `echo "new content" > file1.txt`

- Stage the new changes

    `git add .`

- commit new changes

    `git commit -m "My second change"`

- See the changes you have done

    `git log --graph`



## Create files/changes (GUI)

- Open the folder in vscode.
- If presented witha  security warning, then click yes, to trusting the folder.

- Open file1.txt and add or change the content
- Save the file

- See the number on the icon to the left.

- Select the Soruce control icon

- Select the file
- See the changes you made to the file, compared with the current version

- Type commit message in the "Message" box in the top and apply it, bly clicking `Command + Enter`

- To prepare for the next step, select `Close Folder` from the Top menubar File menu.