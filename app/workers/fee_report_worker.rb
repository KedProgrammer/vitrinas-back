class FeeReportWorker
  include Sidekiq::Worker

  def perform(*args)
    EmployeePaymentsMailer.notify_payment.delivery_later
  end
end
