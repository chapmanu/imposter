# Imposter
Imposter is a Rails application whose purpose is to mock services that are depended on by other web applications.

### Contents
- [Environment Specs](#environment-specs)
- [Setup](#setup)
- [Development](#development)
- [Deployment](#deployment)
- [Server Provisioning](#server-provisioning)

### Environment Specs
- Ruby >= 2.4.0
- Rails >= 5.1.3

### Setup
    git clone git@github.com:chapmanu/imposter.git
    cd imposter
    bundle install

The master encryption key can be found in PassPack. Place the key under `config/` in a new file called `secrets.yml.key`. You will need this key to run tests.

### Development
#### Running local server
To start the local server, use webrick (puma is not configured to run locally):

    rails s webrick

Send browser to http://localhost:3000

#### Running Tests
All tests:

    rails test

Individual test file:

    rails test test/controllers/ping_controller_test.rb

#### Managing secrets
Secrets are encrypted in `secrets.yml.enc`

To edit secrets:

    EDITOR=vi bin/rails secrets:edit

### Deployment
Deployment is automated with [Capistrano](https://github.com/capistrano/capistrano).

To deploy to a local VM:

    cap development deploy branch=my-feature-branch

To deploy to production:

    #deploys master branch by default
    cap production deploy

### Server Provisioning
Webserver provisioning is automated with [Ansible](https://www.ansible.com/).

Playbooks must be run from the `ansible` directory:

    cd devops/ansible

To provision a local VirtualBox VM:

    ansible-playbook webserver.yml -i hosts/virtualbox

To provision production server:

    ansible-playbook webserver.yml -i hosts/production --ask-sudo-pass
