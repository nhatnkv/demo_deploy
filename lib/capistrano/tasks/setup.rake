namespace :setup do
  desc 'restart rails app'
  task :restart do
    on roles(:web) do
      execute 'sudo service unicorn_demo_deploy stop'
      execute 'sudo service unicorn_demo_deploy start'
      execute 'sudo service nginx stop'
    end
  end
end
