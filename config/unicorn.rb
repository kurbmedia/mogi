worker_processes 1
working_directory "/git/app"
preload_app true

timeout 30
listen "/git/mogi/tmp/sockets/unicorn.sock", :backlog => 64
pid "/git/mogi/tmp/unicorn.pid"

stderr_path "/git/mogi/log/unicorn.stderr.log"
stdout_path "/git/mogi/log/unicorn.stdout.log"