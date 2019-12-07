# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'
require "capistrano/scm/git"
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/puma'
require 'capistrano/nginx'
require 'capistrano/rails/console' 

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Nginx
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
