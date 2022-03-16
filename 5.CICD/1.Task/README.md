# CI/CD

## Setup Automatic Build using GitHub Actions

- We will now setup automatic building of docker images, and pushing it to your private repo, using GitHub Actions.

- Open `docker-publish.yml`
- Locate `ENV` and change the beginning of the value int he `IMAGE_NAME` key to match your github repository.
- Talk about the rest of the file in class.

- Copy the file, to the root of your github repo, under `.github/workflows` by running this `cp docker-publish.yml ../../.github/workflows` and commit and push your repo after.

- Open github.com and find your repository, and select Actions
