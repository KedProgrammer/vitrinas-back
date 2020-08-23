class V1::Admin::FeesController < ApplicationController
  def update
    fee = Fee.find(params[:id])
    fee.update(fee_params)
    render json: fee
  end

  def index
    loan = Loan.find(params[:loan_id])
    fees = loan.fees.order(:id)
    render json: fees
  end

  def value
    interest_rate = params[:interest_rate].to_i / 100.0
    interest_rate = Loan.weekly_interest_rate(interest_rate)
    value = Fee.calculate_fee(params[:amount].to_f, interest_rate, params[:months].to_i * 4)
    render json: { formated_number: number_to_currency(value, precision: 0), value: value }
  end

  def pay_fees
    fees = Fee.includes(:loan).where(id: Fee.not_payed.group(:loan_id).minimum(:id).values)
    fees.update_all(status: :payed, payment_date: Date.current)
    loans = []

    fees.each do |fee|
      loan =  fee.loan
      loan.update(remaining_payment: fee.balance, total_payed: loan.amount - fee.balance)
      loans << loan
    end

    render json: Loan.includes(:employee)
  end

  private

  def fee_params
    params.require(:fee).permit(:status)
  end
end
