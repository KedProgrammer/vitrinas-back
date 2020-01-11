class V1::Admin::ReportsController < ApplicationController
  def index
    ::Reports::CreateService.call
    encode = Base64.encode64(File.open("tmp/exports/report.xls", "rb").read)
    render json: encode
  end
end