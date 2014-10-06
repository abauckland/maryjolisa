## Maryjolisa ##

- server set up

The following guidance assumes that you already have ssh access to the server and access to github.

## Application Install/Update ##

### Update Ubuntu ###

    sudo apt-get update
    sudo apt-get upgrade

### Upload application ###

To upload application for the first time go to directory where you would like the application to be installed and import from github

**maryjolisa:**

    cd \apps
    git clone git@github.com:abauckland/maryjolisa.git

Also download dependencies:

**mjweb:**

    cd \apps
    git clone git@github.com:abauckland/mjweb.git

### Update application ###

Update application files from github and remove unwanted directories

    cd /home/manager/apps/mjweb
    git pull origin
    
    cd /home/manager/apps/maryjolisa
    git pull origin   

(use *git stash save "Message"* if does not work because of gemfile.lock)

### install gems ###

    bundle install


### Assets, Database, Seed Data ###
Compile assets, create database and populate with seed data:

    RAILS_ENV=production bundle exec rake assets:precompile
    RAILS_ENV=production bundle exec rake mjweb:install:migrations
    RAILS_ENV=production rake db:migrate
    RAILS_ENV=production rake db:seed

### Secret Keys ###

If application is being installed for first time copy secrets key file across. Alternatively generate secrete key locally and save to file.


### Restart webserver after installation ###

    sudo /etc/init.d/nginx restart

## Error Checking ##

If there is an error when attempt to view the website, in the server console type:

    sudo /etc/init.d/nginx stop
    cd /home/manager/apps/maryjolisa
    passenger start -e production

If version of passenger working them:

    sudo /etc/init.d/nginx stop

If not error check logs in application for error information


