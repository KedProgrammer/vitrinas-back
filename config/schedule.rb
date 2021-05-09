env :PATH, ENV['PATH']
set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
set :bundle_command, 'bundle exec'

every 1.minute do # Use any day of the week or :weekend, :weekday
  runner "EmailLog.create"
end