task create_log: :environment do
  EmailLog.create
end