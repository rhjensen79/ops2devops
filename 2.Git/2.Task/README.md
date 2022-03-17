# Getting started with Git (Remote)

## Fork Repository


- Open browser on https://github.com/TanzuDK/ops2devops

- Make sure you are logged in.

- Click Fork in the top right corner

- Select your user

- Check that you are in your forked repository. 

- The name shoud  githubusername/ops2devops

- Click the green Code button

- Select https

- copy the url

## Clone Repository

- Open VSCode
- Make sure you are not in the existing folder, vi created earlier, but insted in in the root home folder /home/ubuntu

- cd /home/ubuntu

- Run `git clone CopyedURL`
- Open the new folder in VSCode - Top Menu -> File ->Open folder
- If presented by a security warning, accept that you trust the folder and all subfolders.

- You now have a local copy, of the forked Public git repository for this workshop, and is running VS code, from that repository, on the remote server.

## Enable Actions

- To prepare for a later step, open the Action tab, in your new forked repository page on Github.
- Click The green button, to confirm you accept and want to enable actions.
![actions](../images/actions.png)
- Click 4-k8s-1 and select run workflow, on the right.
## Save changes

- To save any changes you do in this repository, you need to commit and push them back to the repo, or else, they will be lost, when this VM get's deleted, after the workshop.

- Note that saving sensetive credentials, in not recommended in a public (or private) git repository, since they can be read by anybody. 