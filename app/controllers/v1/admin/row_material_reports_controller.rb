class V1::Admin::RowMaterialReportsController < ApplicationController
  def index
    ::Reports::CreateRowMaterialService.call
    encode = Base64.encode64(File.open("tmp/exports/row_material_report.xls", "rb").read)
    render json: encode
  end
end   