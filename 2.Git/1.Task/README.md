# Getting started with Git (Local)


## Configure git
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

## Create first Git Repository
```
# Create Folder
mkdir myfirstrepo

# Open folder
cd myfirstrepo

# Initialize git
git init

# Check a new .git folder has been created with content
ls .git
```

## Create files/changes (CLI)
```
# Create a file with text
echo "initial content" > file1.txt

# Stage changes
git add .

# commit changes
git commit -m "My first change"

# make a new change to the file
echo "new content" > file1.txt

# Stage the new changes
git add .

# commit new changes
git commit -m "My second change"

# See the changes you have done
git log --graph
```


## Create files/changes (GUI)
```
# Open the folder in vscode

# Open file1.txt and add or change the content
# Save the file

# See the number on the icon to the left.

# Select the Soruce control icon

# Select the file
# See the changes to the file

# Type commit message in the top and apply it
```