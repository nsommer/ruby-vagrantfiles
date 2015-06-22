#!/bin/bash

# This script runs on every `vagrant up` to deploy the rails app.

cd /vagrant

# Install missing gems.
bundle install

# Start the development server.
echo "To see the rails logs, open an SSH session and type `tail -f /tmp/rails-dev.log`."
rails server >> /tmp/rails-dev.log 2>&1