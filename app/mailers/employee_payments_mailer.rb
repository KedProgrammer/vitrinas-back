class EmployeePaymentsMailer < ApplicationMailer
  def notify_payment
    mail(to: 'shiriux1@gmail.com', subject: 'Notificacion de pago de cuotas')
  end
end
