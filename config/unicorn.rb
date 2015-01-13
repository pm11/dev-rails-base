application          = 'myapp'
application_path     = "/var/#{application}"

worker_processes 2
working_directory "#{application_path}"

listen "/tmp/unicorn_#{application}.sock", :backlog => 128
pid    "/tmp/unicorn_#{application}.pid"

timeout 30

stdout_path "#{application_path}/log/unicorn.stdout_#{application}.log"
stderr_path "#{application_path}/log/unicorn.stderr_#{application}.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

