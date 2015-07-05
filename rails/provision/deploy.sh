#!/bin/bash

# This script runs on every `vagrant up` to deploy the rails app.

cd /vagrant

# Install missing gems.
bundle install

# Start the development server.
# Bind requests to 0.0.0.0 to forward requests from the host to the VM.
echo "To see the rails logs, type `vagrant ssh -- \"tail -f /tmp/rails-dev.log`\"."
rails server -b 0.0.0.0 >> /tmp/rails-dev.log 2>&1
