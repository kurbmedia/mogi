worker_processes 1
working_directory "/git/app"
preload_app true

timeout 30
listen "/git/mogi/tmp/sockets/unicorn.sock", :backlog => 64
pid "/git/mogi/tmp/unicorn.pid"

stderr_path "/git/mogi/log/unicorn.stderr.log"
stdout_path "/git/mogi/log/unicorn.stdout.log"

before_fork do |server, worker|
  
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  
end
