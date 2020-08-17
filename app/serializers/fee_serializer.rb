class FeeSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id,
            :value,
            :interest_amount,
            :balance,
            :fee_number,
            :status,
            :capital_payment

  def value
    number_to_currency(object.value, precision: 0)
  end

  def interest_amount
    number_to_currency(object.interest_amount, precision: 0)
  end

  def capital_payment
    number_to_currency(object.capital_payment, precision: 0)
  end

  def balance
    number_to_currency(object.balance, precision: 0)
  end
end