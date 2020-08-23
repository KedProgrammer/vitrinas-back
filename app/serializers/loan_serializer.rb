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
            :capital_total,
            :total_payed
      
  def interest_rate
    i = (object.interest_rate * 100).round
    i * 4 if object.weekly?
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

  def fee_value
    number_to_currency(object.fee_value, precision: 0)
  end

  def total_payed
    number_to_currency(object.total_payed, precision: 0)
  end

  def period_type
    "#{I18n.t("activerecord.attributes.loan.period_types.#{object.period_type}")}"
  end

  class EmployeeSerializer < ActiveModel::Serializer
    attributes  :name,
                :last_name,
                :identification,
                :cellphone,
                :id
  end
end
