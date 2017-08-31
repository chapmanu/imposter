# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "imposter"
set :repo_url, "git@github.com:chapmanu/imposter.git"
set :deploy_to, '/var/www/imposter'

# rbenv configuration
set :rbenv_type, :system
set :rbenv_ruby, '2.4.0'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, [:web, :workers]

# Linked files
set :linked_files,     %w{config/secrets.yml.key}
set :linked_dirs,      %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Puma configuration: https://github.com/seuros/capistrano-puma
# These will be used to automatically generate and upload puma.rb file.
# Cap should use config/puma.rb to start puma. Confirm in cap output.
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_role, :web
