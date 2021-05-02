module Reports
  class CreateLoansSummaryService < ApplicationService
    def call
    index = 0
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet name: 'Reporte de cuotas'
    format2 =  Spreadsheet::Format.new weight: :bold
    sheet1[index, 0] = 'Usuario'
    sheet1[index, 1] = 'Valor cuota'
    sheet1[index, 2] = 'Cuotas restantes'
    sheet1.row(index).default_format = format2
    index += 1

    Loan.includes(:employee, :fees).each do |loan|
      sheet1[index, 0] = "#{loan.employee.name} #{loan.employee.last_name}"
      sheet1[index, 1] =   number_to_currency(loan.fees.first.value.round, precision: 0)
      sheet1[index, 2] =   loan.fees.not_payed.count
      index += 1
    end

    book.write Rails.root + "tmp/exports/reporte_cuotas.xls"
    end
  end
end
