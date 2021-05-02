module Payments
  class PayFees < ApplicationService
    def call
      fees = Fee.includes(:loan).where(id: Fee.not_payed.group(:loan_id).minimum(:id).values)
      fees.update_all(status: :payed, payment_date: Date.current)
      loans = []

      fees.each do |fee|
        loan =  fee.loan
        loan.update(remaining_payment: fee.balance, total_payed: loan.amount - fee.balance)
        loans << loan
      end

      Reports::CreateLoansSummaryService.call
      EmployeePaymentsMailer.notify_payment.deliver_later
    end
  end
end
