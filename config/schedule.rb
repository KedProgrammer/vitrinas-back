env :PATH, ENV['PATH']
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
set :bundle_command, 'bundle exec'

every :friday, at: '6am' do # Use any day of the week or :weekend, :weekday
  runner "Payments::PayFees.call"
end