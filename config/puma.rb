
  app = "vitrinas-back-capistrano" # App-specific
  bind "unix:/home/ubuntu/vitrinas-back-capistrano/shared/tmp/sockets/puma.socket"

  workers  5
  threads  1, 1 # relying on many workers for thread-unsafe apps

  rackup      DefaultRackup
  port        11592
  environment ENV['RACK_ENV'] || 'production'
  daemonize   true
