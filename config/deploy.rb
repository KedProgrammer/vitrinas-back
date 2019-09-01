lock '3.11.0'

set :application, 'vitrinas-back-capistrano'
set :repo_url, 'git@github.com:KedProgrammer/vitrinas-back.git'
set :global_shared_files, %w(public/uploads)
set :deploy_to, "/home/ubuntu/vitrinas-back-capistrano"
set :shared_path, "/home/ubuntu/vitrinas-back-capistrano/shared"
set :current_path, "/home/ubuntu/vitrinas-back-capistrano/current"
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

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'

  task :start do
    run "/etc/init.d/puma start #{application}"
  end
  

  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
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

  # desc 'Update crontab with whenever'
  # task :update_cron do
  #   on roles(:app) do
  #     within current_path do
  #       execute :bundle, :exec, "whenever --update-crontab #{fetch :whenever_identifier}"
  #     end
  #   end
  # end

  task :tmp_folder do
    on roles(:app) do
      within '/tmp' do
        execute :mkdir, '-p pids'
        execute :mkdir, '-p sockets'
      end
    end
  end

  # desc 'Add symbolic link to npm gulp, critical and axios'
  # task :link_node_modules do
  #   on roles(:app) do
  #     within current_path do
  #       execute :exec, 'npm link gulp'
  #       execute :exec, 'npm link critical'
  #       execute :exec, 'npm link axios'
  #     end
  #   end
  # end

  # desc 'Optimize Application CSS to AyendaRooms'
  # task :optimize_application_css do
  #   on roles(:app) do
  #     within current_path do
  #       execute :exec, 'gulp build-home'
  #       execute :exec, 'gulp build-hotel'
  #       execute :exec, 'gulp build-hotels'
  #     end
  #   end
  # end

  before :starting,  :check_revision
  # after :finishing, :compile_assets
  after :finishing, :cleanup
  after :finishing, :restart
  # after :finishing, :update_cron
  after :finishing, :tmp_folder
  # after :finishing, :link_node_modules
  # before :finished, :optimize_application_css
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
