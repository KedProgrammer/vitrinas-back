lock '3.11.1'

set :application, 'vitrinas'
set :repo_url, 'git@github.com:KedProgrammer/vitrinas-back.git'
set :global_shared_files, %w(public/uploads)
set :puma_threads,    [4, 16]
set :puma_workers, 0 

# Don't change these unless you know what you're doing
set :user, 'ubuntu'
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/var/www/#{fetch(:application)}"
set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :rbenv_ruby, '2.6.5'
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, true
set :nginx_use_ssl, false

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml}
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :ubuntu do
  desc 'Make sure local git is in sync with remote.'

  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'nginx:start', 'puma:nginx_config'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'nginx:restart'
    end
  end



  task :tmp_folder do
    on roles(:app) do
      within '/tmp' do
        execute :mkdir, '-p pids'
        execute :mkdir, '-p sockets'
      end
    end
  end



  desc "Restart Puma"
  task :restart_puma do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, :systemctl, :restart, :puma
    end
  end

  desc "Restart sidekiq"
  task :restart_sidekiq do
    on roles(:sidekiq), in: :sequence, wait: 5 do
      execute :sudo, :systemctl, :restart, :sidekiq
      execute :sudo, :systemctl, :restart, :sidekiq_high
      execute :sudo, :systemctl, :restart, :sidekiq_normal
      execute :sudo, :systemctl, :restart, :sidekiq_low
    end
  end

  before :starting,  :check_revision
  after :finishing, :compile_assets
  after :finishing, :cleanup
  after :finishing, :restart
  after :finishing, :tmp_folder
  after  :finishing, :restart_puma
  after  :finishing, :restart_sidekiq
end

namespace :log do
  task :app do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, "tail -f -n 500 log/#{fetch(:stage)}.log"
      end
    end
  end

  task :sidekiq do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, "tail -f -n 500 log/sidekiq.log"
      end
    end
  end
end
