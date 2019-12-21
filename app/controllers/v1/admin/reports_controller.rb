class V1::Admin::ReportsController < ApplicationController
  def index
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet name: 'Productos'
    sheet1[1,0] = 'HOla mundo'
    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                    :weight => :bold,
                                    :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    book.write Rails.root + 'tmp/exports/report.xls'
    send_file Rails.root + 'tmp/exports/report.xls'
  end
end