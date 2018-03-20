# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, 'Ccview'
set :repo_url, 'git@github.com:Skalnark/ccview.git' # repositório git do seu projeto
set :deploy_to, '/var/www/ccview'
set :branch, 'master'
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"