## EIC Trading Server & Web
This is the web application server and web app client for EIC's trading application (and some other stuff).

## Configuring your local environment
In order to contribute to development of the EIC trading web app, you'll need to set-up your local environment. If you run into issues in this process be sure to check the troubleshooting section of this README. It's likely that your issue has a solution that is covered in this section.

### Step 1 - Vagrant and Virtualbox
Grab the latest version of vagrant + virtualbox and install them on your local machine before continuing.
* [Vagrant Download](https://www.vagrantup.com/downloads.html)
* [Virtualbox Download](https://www.virtualbox.org/wiki/Downloads)

### Step 2 - Initializing your local git repo
You should clone the git repo for this project on your local machine somewhere before continuing.

### Step 3 - Launching the virtual machine
Now that you have the codebase, vagrant and virtualbox on your machine, it's time to launch your virtual machine. The following command will launch your VM as well as run a provisioning script which will install all project dependencies.

    vagrant up

### Step 4 - Connecting to your virtual machine
Once your VM is up and running you will need to connect to it. To do this we do the following:

    vagrant ssh

### Step 5 - Configuring your ruby environment
Once you `ssh` into your VM after setting up your environment variables, we need to install all ruby libraries. To do this run the bundle command below:

    sudo gem install bundler -v 1.15.3
    bundle install

### Step 6 - Setting up your database
Once your ruby environment is initialized you will need to configure your local postgresql database. To do this copy and paste the following set of commands into your console. Ensure you `ssh` before running this.

    sudo su postgres
    pg_dropcluster --stop 9.1 main ; pg_createcluster --start --locale en_US.UTF-8 9.1 main
    exit
    sudo -u postgres createuser -s eic_development
    sudo -u postgres psql -c "ALTER USER eic_development WITH PASSWORD 'eic_development'"

### Step 7 - Provisioning your database
Now that your database configuration has been set you should provision your database with our application's schema.

    rake db:create
    rake db:migrate

### Step 8 - Indexing in ElasticSearch
We use elasticsearch to cache and search a good part of our database data. To initialize all of the indices in our system run the following command:

    rake index:create:all

### Step 9 - Launching the web server
At this point all resources have been installed and initialized and you are ready to start your rails server. To do this use the following command:

    bundle exec puma -C config/puma.rb

OR to start just one instance of the server:

    rails s -b 42.42.42.42

You should be able to access your running web app via your web browser now. You can access it via the following ip address.

    ip address: 42.42.42.42:3000

## Working with Rails migrations
Fixing issues with migrations in a production environment is time-consuming and risky. In order to avoid issues, we should follow the following best practices:

Always use Rails' migration generator to create new migrations.

    rails generate migration AddUserToLandscape

Never change the timestamp of a migration -- there should never be a need to change it. Make sure to also test your migrations in reverse. Run `rake db:rollback` after running `rake db:migrate` to make sure your migration won't fail if it needs to be rolled back.

## Working with Rails tests
As of Rails 4.1 you must maintain your test database/environment manually. Run the following commands to ensure that happens. The migration step must be run each time the database schema updates.

    RAILS_ENV=test;bundle exec rake db:create;RAILS_ENV=development
    RAILS_ENV=test;bundle exec rake db:migrate;RAILS_ENV=development
    RAILS_ENV=test;bundle exec rake test:prepare;RAILS_ENV=development

Once migrated, you can run the tests with the following command:

    RAILS_ENV=test;bundle exec rake test;RAILS_ENV=development

Finally, if you would like to run a specific test we use the `m` gem for this as follows:

    RAILS_ENV=test;bundle exec m test/functional/controllers/api/v4/companies_controller_test.rb:13;RAILS_ENV=development

## Working with Bower & Grunt
We use bower to install locally all the `JS` libraries grunt will need to compile our front-end web client. Ocassionally you will need to update or add a library in bower. You can do that with a command like the following:

    bower install ember-data#1.0.0-beta.11 --save-dev

Once all of your libraries are installed you can deploy the web client with one of the following commands. `dev` will wait for new file revisions and automatically re-deploy while `deploy` will deploy once and not wait for new file updates.

    grunt dev
    grunt deploy

## Using the virtual machine
Variant and virtualbox are not difficult to use. Below are some general commands to help you in managing your local VM.

This first set of commands should be your basic operating commands.

    vagrant up - Boot the VM (or awake from sleep mode)
    vagrant ssh - Connect to the VM
    exit - Exit the VM
    vagrant suspend - Put the VM into sleep mode

If you run into issues with your VM, you can always hard shutdown your VM with the following command:

    vagrant halt -f

Finally, if your VM is locking up often or in general running very slow then it might be time to destroy and rebuild your VM.

    vagrant destroy -f

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

## Troubleshooting the Web Server
VMs and their providers (virtualbox) can sometimes misbehave. If you run into issues with the above process, don't panic, you're not the first to run into issues. Below are some issues along with some general solutions to problems you may run into.

### VM Boot issues
If you run into issues when booting your VM, don't panic. The issue very well may be that you need to restart the virtualbox instance. The following command will reboot that instance, keep in mind the file path, yours may be installed somewhere else.

    sudo /Library/StartupItems/VirtualBox/VirtualBox restart

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
http://eicgaming.com/api/v1/users.php
```