# herobu

herobu hits circleci nightly api with heroku in order to make pull request for bundle update periodically.

[masutaka/circleci-bundle-update-pr](https://github.com/masutaka/circleci-bundle-update-pr) makes pull request. herobu is a just trigger.

## Usage

### Preparation

- Add `circleci-bundle-update-pr` gem in your project
- Create circle.yml to your project like following

#### circleci 2.0

```yaml
version: 2
jobs:
  nightly-build:
    docker:
      - image: your-docker-image
    steps:
      - checkout
      - bundle install
      - run: bundle exec circleci-bundle-update-pr 'Git Usename' 'Git email address'
```


#### circleci 1.0

```yaml
deployment:
  production:
    branch: master
    commands:
      - |
        if [ -z "${BUNDLE_UPDATE}" ] ; then
          ./bin/deploy.sh
        else
          bundle exec circleci-bundle-update-pr 'Git Usename' 'Git email address'
        fi
test:
  override:
    - |
      if [ -z "${BUNDLE_UPDATE}" ] ; then
        bundle exec rake
      fi
```

### We're on

- Create heroku application
- Push this repository to there
- Set environmental variable
    - PROJECT=your_github_name/your_project_name
    - CIRCLE_TOKEN=your_circleci_token
    - BRANCH=target_branch_name (default: master)    
    - JOB=your_job_name (circleci2.0 only)
- Add Heroku Scheduler and add task
  - ciecleci 1.0 `./fire.sh`
  - ciecleci 2.0 `./fire2.sh`

That's it!
