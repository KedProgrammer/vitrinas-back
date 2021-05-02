class EmployeePaymentsMailer < ApplicationMailer
  def notify_payment
    attachments['reporte_cuotas.xls'] = File.read( Rails.root + "tmp/exports/reporte_cuotas.xls")
    mail(to: 'shiriux1@gmail.com', subject: 'Notificacion de pago de cuotas')
  end
end
