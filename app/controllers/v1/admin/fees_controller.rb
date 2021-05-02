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
    Payments::PayFees.call

    render json: Loan.includes(:employee)
  end

  def pay_fee
    loan = Loan.includes(:fees).find(params[:loan_id])
    fee = loan.fees.find_by(id: loan.fees.not_payed.minimum(:id))

    if fee
      fee.update(status: :payed, payment_date: Date.current)
      loan.update(remaining_payment: fee.balance, total_payed: loan.amount - fee.balance)

      render json: LoanWithFeesSerializer.new(loan).to_json, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def rollback_fee
    loan = Loan.includes(:fees).find(params[:loan_id])
    fee = loan.fees.find_by(id: loan.fees.payed.maximum(:id))

    if fee
      fee.update(status: :not_payed, payment_date: nil)
      loan.update(remaining_payment: loan.remaining_payment + fee.capital_payment, total_payed: loan.total_payed - fee.capital_payment)

      render json: LoanWithFeesSerializer.new(loan).to_json, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def fee_params
    params.require(:fee).permit(:status)
  end
end
