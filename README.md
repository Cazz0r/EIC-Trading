## EIC Trading Server & Web (Blueshift)
This is the web application server and web app client for EIC's trading application.

## Setup Environment
In order to contribute to development of the EIC trading web app, you'll need to set-up your local environment.

### Step 1 - Download Docker
Install the latest version of [Docker CE](https://store.docker.com/search?type=edition&offering=community) on your local machine and [create an account](https://hub.docker.com/) if you don't already have one. If you're running on Linux, use the command line installation instructions.

### Step 2 - Clone Project
From your terminal, `cd` into a folder where you want the Blueshift project to live and init the repo.
```
$ git init
$ git remote add origin https://github.com/Cazz0r/EIC-Trading.git
$ git fetch
$ git checkout master
```

### Step 4 - Add the Project Aliases
Add [our aliases](https://github.com/Cazz0r/EIC-Trading/wiki/Aliases) to your `.bash_profile`(on Mac) or `.bashrc`(on Linux).
```
$ vim ~/.bashrc
```

### Step 5 - Build Containers
After Docker is running and the project aliases are in your local environment, build the containers using:
```
$ eic-dcbuild
```

On your first build of the container, you will have to run migrations on the new database instance:
```
eic-rake db:migrate
```

Once the containers are built, you can start the containers in later development sessions with the following command. The build command is only needed for the first build of the container or if project library dependencies are updated.
```
eic-dcup
```

Your environment is now accessible at [localhost:4242](http://localhost:4242).

## Working with Rails migrations
Fixing issues with migrations in a production environment is time-consuming and risky. In order to avoid issues, we should follow the following best practices:

Always use Rails' migration generator to create new migrations.

    eic-rails generate migration AddUserToLandscape

Never change the timestamp of a migration -- there should never be a need to change it. Make sure to also test your migrations in reverse. Run `eic-rake db:rollback` after running `eic-rake db:migrate` to make sure your migration won't fail if it needs to be rolled back.

## Tests
Setup test database and run all tests:
```
$ eic-rails db:setup RAILS_ENV=test
$ eic-bundle exec rake test RAILS_ENV=test
```

Run a specific test using the `m` gem:
```
$ eic-bundle exec m test/path/to/test.rb:8 RAILS_ENV=test
```

## Using GIT with EIC
We have some general rules that we like to follow when using GIT with EIC's ruby server. So long as we follow the below rules then we should never have to do any cherry picking or difficult merging.

### Rule 1 - Don't cross-merge branches
If `branch-a` and `branch-b` are both branched off of `master`, `branch-a` and `branch-b` should never be merged into any branch but master. Adhering to this strict hierarchy rule will avoid any question of what code is where, and we should avoid cross-merging all together.

### Rule 2 - Stick to the following commands
Git is not a complicated system and you should never have to do things like rebasing so long as you stick to the following command set.

    git init
    git fetch
    git remote
    git checkout
    git add -A
    git commit
    git status
    git pull
    git push
    git merge

## Inegration with Auth on core EIC server
The following are examples of how to access users on the EIC server along with how to auth from the EIC server. The third example is how we verify auth creds.

```
// Get user
GET /api/v1/users.php?username=Cazz0r&password=test
> 200 OK {"user":{"username":"Cazz0r","tags":["bgs-nerd"]}}

// Get user
GET /api/v1/users.php?username=Cazz0r&password=test&bgs-nerd
> 200 OK {"user":{"username":"Cazz0r","tags":["bgs-nerd"],"bgs-nerd":true}}

// Auth creds
GET /api/v1/users.php?username=Cazz0r&password=test&sales-nerd
> 401 Unauthorized {"user":{"username":"Cazz0r","tags":["bgs-nerd"],"sales-nerd":false}}

// Full domain example
https://eicgaming.com/api/v1/users.php

// MySQL Creds (read permission only)
Host: eicgaming.com
Port: 3306
User: drieton
Pass: passwordofdrieton
```

# Heroku Stack Upgrades
Occasially maintenance must be done in the form of upgrading the base linux box being run on Heroku. These are very general boxes and easy to set up and use. We are currently using `heroku-24` as of `June 2025`. The following commands will have gather this information about the running Heroku service.

```
heroku stack -a eic-sister
heroku stack:set heroku-24 -a eic-sister
heroku releases -a eic-sister
heroku releases:rollback v110 -a eic-sister
```