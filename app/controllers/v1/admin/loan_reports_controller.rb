class V1::Admin::LoanReportsController < V1::Admin::ApplicationController
  def create
    Reports::Loan.call
    encode = Base64.encode64(File.open("tmp/exports/report.xls", "rb").read)
    render json: encode
  end
end