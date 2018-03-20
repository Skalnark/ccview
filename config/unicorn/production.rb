
root="/var/www/ccview/current"
working_directory root

pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

worker_process 4
timeout 30
preload_app true

listen '/tmp/ccview.sock', backlog: 64