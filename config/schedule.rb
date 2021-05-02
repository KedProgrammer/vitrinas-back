every 1.minutes do # Use any day of the week or :weekend, :weekday
  runner 'Reports::CreateLoansSummaryService.call'
  command 'echo "hola mundo"'
end