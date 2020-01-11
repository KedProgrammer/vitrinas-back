module Reports
  class CreateService < ApplicationService
    def call
    index = 0
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet name: 'Productos'
    format = Spreadsheet::Format.new weight: :bold, pattern_fg_color: :blue, pattern: 1
    format2 =  Spreadsheet::Format.new weight: :bold
    sheet1[index, 0] = 'Productos'
    sheet1[index, 1] = 'Costo'
    sheet1[index, 2] = 'Precio venta'
    sheet1.row(index).default_format = format2
    index += 1

    CategoryProduct.includes(:products).each do |category_product|
      sheet1[index, 0] = category_product.name
      sheet1.row(index).set_format(0, format)
      index += 1

      category_product.products.each do |product|
        sheet1[index, 0] = product.name
        sheet1[index, 1] = number_to_currency(product.cost.round, precision: 0)
        sheet1[index, 2] = number_to_currency(product.price.round, precision: 0)
        index += 1
      end
    end

    book.write Rails.root + 'tmp/exports/report.xls'
    end
  end
end