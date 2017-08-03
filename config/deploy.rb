# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "imposter"
set :repo_url, "git@github.com:chapmanu/imposter.git"
set :deploy_to,   '/var/www/imposter'

# ruby configuration
set :rbenv_type, :system
set :rbenv_ruby, '2.1.10'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, [:web, :workers]

# puma configuration
set :puma_threads,    [4, 16]
set :puma_workers,    1
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_init_active_record, true
set :puma_daemonize, true
set :puma_role, %w{web app}