## Maryjolisa ##

The following guidance assumes that:

- the server is setup (nginx, passenger, rvm, ruby, rails, mysql, postfix)
- you have ssh access to the server
- you have access to github.

## Server Setup ##

Set up required for rmagic gem on Ubuntu 14.04

    sudo apt-get install imagemagick
    sudo apt-get install libmagickwand-dev
    gem install rmagick

then need to run rake db:migrate to get carrierwave to work – not sure why?

    sudo service nginx restart


## Application Install/Update ##

### Update Ubuntu ###

    sudo apt-get update
    sudo apt-get upgrade

### Download application ###

To upload application for the first time go to directory where you would like the application to be installed and import from github

    mkdir /home/manager/apps

**maryjolisa:**

    cd \apps
    git clone git@github.com:abauckland/maryjolisa.git

Also download dependencies:

**mjweb:**

    cd \apps
    git clone git@github.com:abauckland/mjweb.git

On initial download check and where appropriate remove the following data/files:

- Delete local public image files – public/uploads
- development.log
- production.log
- production database

### Update application ###

Update application files from github and remove unwanted directories

    cd /home/manager/apps/mjweb
    git pull origin
    
    cd /home/manager/apps/maryjolisa
    git pull origin   

(use *git stash save "Message"* if does not work because of gemfile.lock)


### install gems ###
    
    cd /home/manager/apps/maryjolisa
    bundle install


### Assets, Database, Seed Data ###
Compile assets, create database:

    cd /home/manager/apps/maryjolisa

    RAILS_ENV=production bundle exec rake assets:precompile
    RAILS_ENV=production bundle exec rake mjweb:install:migrations
    RAILS_ENV=production rake db:migrate

The database is seeded using the [sprig](https://github.com/vigetlabs/sprig) gem

    RAILS_ENV=production rake db:seed

### Secret Keys ###mjweb:install:migrations

If application is being installed for first time copy secrets key file across to the server. Alternatively generate secrete key locally and save to file.

    rake secret

Insert key into: *config/initializers/secret_token.rb* 

### Configure Nginx

Refer to separate guide: *Mj Nginx Setup.md*

### Restart webserver after installation ###

    sudo service nginx restart

## Error Checking ##

If there is an error when attempt to view the website, in the server console type:

    sudo /etc/init.d/nginx stop
    cd /home/manager/apps/maryjolisa
    passenger start -e production

If version of passenger working them:

    sudo /etc/init.d/nginx stop

If not error check logs in application for error information


