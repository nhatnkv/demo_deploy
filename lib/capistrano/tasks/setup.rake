namespace :setup do
  desc 'restart rails app'
  task :restart do
    on roles(:web) do
      execute 'rails s'
    end
  end
end
