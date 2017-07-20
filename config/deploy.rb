# config valid only for current version of Capistrano
lock "3.8.2"

set :application, 'demo_deploy'
set :repo_url, 'git@github.com:nhatnkv/demo_deploy.git'
set :branch, :master
set :deploy_to, "var/www/#{fetch(:application)}"

set :pty, true
# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundler public/system public/uploads}
set :deploy_via, :remote_cache
set :keep_releases, 5

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)}"
set :rbenv_map_bins, %w{rails gem bunlder ruby rake}
set :rbenv_roles, :all

set :nginx_config_pat, 'etc/nginx/conf.d'
set :unicorn_env, fetch(:rack_env, fetch(:rails_env, 'production'))

# Default branch is, :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5
