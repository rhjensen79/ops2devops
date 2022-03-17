# 1. Task - Build Container using Github Actions

## Setup Automatic Build using GitHub Actions

- We will now setup automatic building of docker images, and pushing it to your private repo, using GitHub Actions.

- Open `docker-publish.yml`
- Talk about the the file in class.
    - On
    - Env
    - Variables
    - Jobs
    - Packages

- Copy the file, to the root of your github repo, under `.github/workflows` by running this `cp docker-publish.yml ../../.github/workflows` and commit and push your repo after.

- Open github.com and find your repository, and select Actions
- Under `Workflows` your should now see 2 workflows. `4-k8s-1` and `5-k8s-1`.
- The naming represents module and task, of this class. We will only focus on `5-k8s-1` from now on.
- Click on the top `Workflow Run`. The name is the same as your last commit message.
- You should now see your stages. You only have one called `Build` so click on that.
- You can now see all the stages, that we setup in the file. 
- Click on the `Code` tab, and then on `Packages` in the right side.
- Here you can see the 2 container images, you have in your repository. They are now build automaticly, on every push you do.
- !!! If any of your container images has a `private` label next to it, then follow the steps from `4.Kubernetes/1.Task`to make it public.

- Talk in class about :
    - Versions
    - Triggers
    - Build phases
    - Variables
    - Secrets
    - Artifacts
    - Types of jobs
    - Hosted runners

## Trigger new build

- Change the `index.html` file under `html` with new content. And commit and push changes to GitHub.
- Watch the action trigger again, and see a new build being created. 

