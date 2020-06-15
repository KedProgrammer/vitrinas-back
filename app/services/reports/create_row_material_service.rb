module Reports
  class CreateRowMaterialService < ApplicationService
    def call
    index = 0
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet name: 'Materia prima'
    format = Spreadsheet::Format.new weight: :bold, pattern_fg_color: :blue, pattern: 1
    format2 =  Spreadsheet::Format.new weight: :bold
    sheet1[index, 0] = 'Materia prima'
    sheet1[index, 1] = 'Precio'
    sheet1[index, 2] = 'Codigo'
    sheet1.row(index).default_format = format2
    index += 1

    CategoryRowMaterial.includes(:row_materials).each do |category_row_material|
      sheet1[index, 0] = category_row_material.name
      sheet1.row(index).set_format(0, format)
      index += 1

      category_row_material.row_materials.each do |row_material|
        sheet1[index, 0] = row_material.name
        sheet1[index, 1] = number_to_currency(row_material.price&.round, precision: 0)
        sheet1[index, 2] = row_material.code
        index += 1
      end
    end

    book.write Rails.root + 'tmp/exports/row_material_report.xls'
    end
  end
end