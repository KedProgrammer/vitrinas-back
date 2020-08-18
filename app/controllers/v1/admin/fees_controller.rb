class V1::Admin::FeesController < ApplicationController
  def update
    fee = Fee.find(params[:id])
    fee.update(fee_params)
    render json: fee
  end

  def index
    loan = Loan.find(params[:loan_id])
    fees = loan.fees
    render json: fees
  end

  def value
    interest_rate = params[:interest_rate].to_i / 100.0
    interest_rate = Loan.weekly_interest_rate(interest_rate)
    value = Fee.calculate_fee(params[:amount].to_f, interest_rate, params[:months].to_i * 4)
    render json: { formated_number: number_to_currency(value, precision: 0), value: value }
  end

  private

  def fee_params
    params.require(:fee).permit(:status)
  end
end
