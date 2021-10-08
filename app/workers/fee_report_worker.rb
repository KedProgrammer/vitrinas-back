class FeeReportWorker
  include Sidekiq::Worker

  def perform(*args)
    EmployeePaymentsMailer.notify_payment.deliver_later
  end
end
