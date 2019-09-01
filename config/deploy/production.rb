# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "18.223.247.60", user: "ubuntu"

role :app, fetch(:connection)
role :web, fetch(:connection)
role :db,  fetch(:connection)

set :branch, 'master'
set :rails_env, 'production'
