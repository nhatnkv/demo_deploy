# config valid only for current version of Capistrano
lock "3.8.2"

set :application, 'demo_deploy'
set :repo_url, 'git@github.com:nhatnkv/demo_deploy.git'
set :branch, :master
set :deploy_to, '/var/www/demo_deploy'

set :pty, true
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :deploy_via, :remote_cache
set :keep_releases, 5

set :repository_cache, "cached_copy" 
set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :nginx_config_pat, 'etc/nginx/conf.d'
set :unicorn_env, fetch(:rack_env, fetch(:rails_env, 'production'))

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "unicorn:restart"
    end
  end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #   end
  # end
  after :publishing, :restart
end
