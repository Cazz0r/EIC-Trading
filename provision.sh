#!/usr/bin/env bash

# Fail fast
set -e

# Override echo to provide colored and helpful output
function echo_pretty(){ builtin echo -e '\E[36m'$(basename $0 .sh): '\E[33m'$1; }

echo_pretty "Starting eicweb provisioner..."

# Update apt
echo_pretty "Updating apt..."
apt-get update

# Install packages that are necessary:
#
#    If you need something on the VM in the future, add it here and
#    write a note about what it's for below.
#
#     - build-essential: need this to do anything with compilation
#     - curl: for accessing remote things
#     - libssl-dev: Need to work with SSL in dev
#     - pkg-config: Used to compile things, helper lib.
#     - htop: Useful ops tool. Try running `htop` from your shell.
#     - git-core: Need git for some bundle activity.

echo_pretty "Installing basic dependencies..."

apt-get install -y \
    build-essential \
    curl \
    libssl-dev \
    pkg-config \
    htop \
    git-core \
    vim \

# echo_pretty "Installing Java..."

# apt-get install -y software-properties-common python-software-properties # Install prerequisites for Oracle version of Java
# add-apt-repository -y ppa:openjdk-r/ppa # Add Oracle Java repo
# apt-get update # Update system
# apt-get install -y openjdk-8-jre-headless # Install JDK version

# Install RVM so we can manage rubies.
#
#   Because we might already have provisioned, we first check to see if
#   a default ruby exists in RVM - if not, we probably need to
#   install / reinstall it.
#

echo_pretty "Installing RVM..."

# Check to see if we have RVM and correct Ruby already
if [ ! -d "/home/vagrant/.rvm/rubies/default/" ]; then
    echo_pretty "Installing RVM requirements..."
    # These requirements are necessary to install RVM.
    apt-get install -y \
        libreadline6-dev \
        libsqlite3-dev \
        sqlite3 \
        libxml2-dev \
        libxslt1-dev \
        autoconf \
        libgdbm-dev \
        libncurses5-dev \
        automake \
        libtool \
        bison \
        libffi-dev \
        libyaml-dev \
        gawk

    if grep -q rvm /etc/group; then
       echo_pretty "RVM group already exists."
    else
       echo_pretty "Creating the RVM group..."
       groupadd rvm
    fi

    echo_pretty "Adding the vagrant user to RVM group..."
    # Add the vagrant user to the RVM group
    usermod -a -G rvm vagrant

    echo_pretty "Set up GPG requirements..."
    # Install RVM
    su -l -c 'gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys D39DC0E3' vagrant

    echo_pretty "Downloading and installing RVM..."
    # Install RVM
    su -l -c 'curl -L https://get.rvm.io | bash -s stable' vagrant

    echo_pretty "Installing Ruby 2.4.1..."
    # Install Ruby
    su -l -c 'rvm install 2.4.1' vagrant
    su -l -c 'rvm --default use 2.4.1' vagrant

    # Output the Ruby version
    #
    #   We do this to let a developer know what version of ruby is
    #   being automatically installed and provisioned on the VM.
    #
    echo_pretty "Ruby version: `su -l -c 'ruby --version' vagrant`"
else
    echo_pretty "Looks like RVM exists. Assuming RVM installation with ruby version: `su -l -c 'ruby --version' vagrant`..."
fi

# Install foreman to start / stop various web and backend services.
#su -l -c \
#    'JRUBY_OPTS="-Xcext.enabled=true" rvm all do gem install foreman --no-ri --no-rdoc' vagrant

# Nokogiri dependencies
#
#   HTML / XML parser.
#
apt-get install -y \
    libxslt-dev \
    libxml2-dev

# Compile node.js
#
#   This is sadly required to compile Javascripts in the asset pipeline.
#   Sigh.
#
echo_pretty "Installing Node..."

if [ ! -f "/usr/local/bin/node" ]; then
    echo_pretty "Downloading Node..."
    pushd /tmp
    wget --quiet http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz
    tar xvzf node-v0.10.33.tar.gz
    cd node*
    echo_pretty "Configuring and installing Node..."
    ./configure
    make V=""
    make V="" install
    popd
    # Clean up
    rm -rf node*
else
    echo_pretty "Looks like Node exists. Assuming Node installation..."
fi

# Install Postgres
# echo_pretty "Installing Postgres..."

# if [ ! -f "/usr/bin/psql" ]; then
#     apt-get install -y  \
#             postgresql \
#             libpq-dev \
#             postgresql-client

#     # Insure that the locale is properly set for postgres
#     locale-gen en_US.UTF-8
#     update-locale LANG=en_US.UTF-8

#     sudo -u postgres createuser -s eic_development
#     sudo -u postgres psql -c "ALTER USER eic_development WITH PASSWORD 'eic_development'"
# else
#     echo_pretty "Looks like Postgres exists. Assuming Postgres installation..."
# fi

# Automatically move into the shared folder, but only add the command
# if it's not already there.
grep -q 'cd /vagrant' /home/vagrant/.bash_profile || echo 'cd /vagrant' >> /home/vagrant/.bash_profile

##############################################################################################################################
# ElasticSearch
##############################################################################################################################
# echo_pretty "Installing ElasticSearch..."

# if [ ! -f "/usr/share/elasticsearch/bin/elasticsearch" ]; then
#     echo_pretty "Downloading ElasticSearch..."
#     pushd /tmp
#     wget --quiet https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.deb
#     echo_pretty "Configuring and installing ElasticSearch 5.4.0..."
#     dpkg -i elasticsearch-5.4.0.deb
#     rm -rf elasticsearch*
#     # Config settings
#     sudo echo "cluster.name: eic-web-local"      >> /etc/elasticsearch/elasticsearch.yml
#     sudo echo "node.name: node-local-1"           >> /etc/elasticsearch/elasticsearch.yml
#     sudo echo "network.bind_host: 0.0.0.0"        >> /etc/elasticsearch/elasticsearch.yml
#     sudo echo "network.publish_host: 42.42.42.42" >> /etc/elasticsearch/elasticsearch.yml
#     sudo echo "http.port: 9200"                   >> /etc/elasticsearch/elasticsearch.yml
#     # Set PID & Java options
#     sudo echo "PID_DIR=/var/run"                                             >> /etc/default/elasticsearch
#     sudo echo 'ES_JAVA_OPTS="-Dlog4j2.disable.jmx=true -Xms2048m -Xmx2048m"' >> /etc/default/elasticsearch
#     # Automatically start ES instance
#     sudo update-rc.d elasticsearch defaults 95 10
#     sudo -i service elasticsearch start
# else
#     echo_pretty "Looks like ElasticSearch exists. Assuming ElasticSearch installation..."
# fi

# echo_pretty "Installing Kibana..."

# if [ ! -f "/usr/share/elasticsearch/bin/kibana" ]; then
#     echo_pretty "Downloading Kibana..."
#     pushd /tmp
#     wget --quiet https://artifacts.elastic.co/downloads/kibana/kibana-5.4.0-amd64.deb
#     echo_pretty "Configuring and installing Kibana 5.4.0..."
#     dpkg -i kibana-5.4.0-amd64.deb
#     rm -rf kibana*
#     # Config settings
#     sudo echo 'server.name: "kibana-eic-web-local"'      >> /etc/kibana/kibana.yml
#     sudo echo 'elasticsearch.url: "http://0.0.0.0:9200/"' >> /etc/kibana/kibana.yml
#     sudo echo 'server.host: "42.42.42.42"'                >> /etc/kibana/kibana.yml
#     sudo echo 'kibana.index: ".kibana"'                   >> /etc/kibana/kibana.yml
#     # Automatically start Kibana instance
#     sudo update-rc.d kibana defaults 95 10
#     # sudo -i service kibana start
# else
#     echo_pretty "Looks like Kibana exists. Assuming Kibana installation..."
# fi
##############################################################################################################################
##############################################################################################################################

echo_pretty "Installing ImageMagick..."
if [ ! -f "/usr/bin/convert" ]; then
    echo_pretty "Configuring and installing ImageMagick..."
    apt-get install -y imagemagick
else
    echo_pretty "Looks like ImageMagick exists. Assuming ImageMagick installation..."
fi

# Install RMagick dependency
echo_pretty "Installing RMagick dependency..."
apt-get install -y libmagickwand-dev

# echo_pretty "Installing Redis..."
# if [ ! -f "/usr/local/bin/redis-server" ]; then
#     echo_pretty "Configuring and installing Redis..."
#     # Install Redis
#     pushd /tmp
#     wget http://download.redis.io/releases/redis-3.2.0.tar.gz
#     tar xvzf redis-3.2.0.tar.gz
#     cd redis*
#     make install
#     popd
#     rm -rf redis*

#     # Create an upstart script for Redis
#     cat >/etc/init/redis-server.conf <<INIT
# description "redis server"

# start on runlevel [23]
# stop on shutdown

# exec /usr/local/bin/redis-server --daemonize no

# respawn
# INIT

#     start redis-server
# else
#     echo_pretty "Looks like Redis exists. Assuming Redis installation..."
# fi

# Install MySQL
# echo_pretty "Installing MySQL..."
# apt-get install -y mysql-server-5.5
# echo_pretty "Installing MySQL Install DB..."
# mysql_install_db

echo_pretty "Provisioning complete!"
