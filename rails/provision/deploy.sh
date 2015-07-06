#!/bin/bash

# This script runs on every `vagrant up` to deploy the rails app.

cd /vagrant

# Install missing gems.
bundle install
rbenv rehash

# Start the development server.
# Bind requests to 0.0.0.0 to forward requests from the host to the VM.
echo 'To see the rails logs, type `tail -f log/development.log`.'
rails server -b 0.0.0.0 -d
