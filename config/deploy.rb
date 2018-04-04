# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, 'Ccview'
set :repo_url, 'https://github.com/Skalnark/ccview.git' # repositório git do seu projeto
set :deploy_to, '/var/www/ccview'
set :branch, 'capistrano'
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
set :rvm_type, :system 
append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

after 'deploy:publishing', 'deploy:restart'

###namespace :deploy do
###	task :restart do
		invoke 'unicorn:stop'
		invoke 'unicorn:start'
###	end
###end