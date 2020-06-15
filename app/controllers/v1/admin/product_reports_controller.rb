class V1::Admin::ProductReportsController < ApplicationController
  def index
    ::Reports::CreateProductService.call
    encode = Base64.encode64(File.open("tmp/exports/report.xls", "rb").read)
    render json: encode
  end
end