lock '3.11.0'

set :application, 'vitrinas-back'
set :repo_url, 'git@github.com:KedProgrammer/vitrinas-back.git'
set :global_shared_files, %w(public/uploads)
set :deploy_to, '/home/deploy/vitrinas-back'
set :shared_path, '/home/deploy/vitrinas-back/shared'
set :current_path, '/home/deploy/vitrinas-back/current'
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :puma_threads, [4, 16]
set :puma_workers, 6
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false  # Change to false when not using ActiveRecord
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.5.1' # Edit this if you are using MRI Ruby