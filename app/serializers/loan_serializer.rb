class LoanSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  has_one :employee
  attributes :id,
            :interest_rate,
            :amount,
            :remaining_payment,
            :period_number,
            :fee_value,
            :period_type,
            :employee,
            :capital_total

  def interest_rate
    (object.interest_rate * 100).round
  end

  def amount
    number_to_currency(object.amount, precision: 0)
  end

  def remaining_payment
    number_to_currency(object.remaining_payment, precision: 0)
  end

  def capital_total
    number_to_currency(object.amount - object.remaining_payment, precision: 0)
  end

  class EmployeeSerializer < ActiveModel::Serializer
    attributes  :name,
                :last_name,
                :identification,
                :cellphone
  end
end
