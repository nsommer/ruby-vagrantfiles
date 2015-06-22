#!/bin/bash

# Provisioner script for a Vagrant box.
# Sets up stuff rbenv and the specified ruby version.

# Ruby build dependencies.
# Source: https://github.com/sstephenson/ruby-build/wiki
ruby_deps="autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev"
ruby_version=$(cat /vagrant/.ruby-version)

echo "Setting up rbenv and ruby $ruby_version"

# Install git, sqlite, bundler and build dependencies for ruby.
sudo apt-get update
sudo apt-get install git bundler sqlite3 $ruby_deps -y

# Install and setup rbenv.
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# It would be cleaner to just source .bashrc rather than repeating the commands here,
# but for whatever reason that doesn't work
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Reload bash profile to update PATH.
# Does not work for whatever reason.
# source ~/.bashrc

# Install ruby.
rbenv install $ruby_version

# Override global ruby version.
rbenv global $ruby_version

# Print useful information.
echo "If you add gems that install ruby executables, type `rbenv rehash` to install the corresponding shims."
