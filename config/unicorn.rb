worker_processes 1
working_directory "/git/app"
preload_app true

timeout 30
listen "/git/app/tmp/sockets/unicorn.sock", :backlog => 64
pid "/git/app/tmp/unicorn.pid"

stderr_path "/git/app/log/unicorn.stderr.log"
stdout_path "/git/app/log/unicorn.stdout.log"