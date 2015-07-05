Vagrantfiles for Ruby development
==================================

This repository contains Vagrantfiles and provisioning scripts for ruby development.

Table of Contents
------------------
* [Ruby Apps](#ruby-apps)
* [Ruby On Rails Apps](#ruby-on-rails-apps)

Ruby Apps
----------
The `ruby` directory contains a Vagrantfile and a provisioning script that installs **rbenv** and the ruby version specified in `.ruby-version`.

Ruby On Rails Apps
-------------------
The `rails` directory contains a Vagrantfile and a provisioning that do the same as the ones for simple ruby apps.
However, there is also another script that runs everytime you call `vagrant up`. This script installs the gems from your *Gemfile* and starts the ruby development server.
The default HTTP port of the built in rails server (3000) is forwarded from the VM to your host so you can access your webapp from the browser as you would when running the webapp on your host.

The logs from the development server are directed into a text file. You can read them by typing:

```bash
vagrant ssh -- "tail -f /tmp/rails-dev.log"
```
