every :day, at: '3:05pm' do # Use any day of the week or :weekend, :weekday
  runner 'EmailLog.create'
end