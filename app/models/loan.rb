# == Schema Information
#
# Table name: loans
#
#  id                :bigint(8)        not null, primary key
#  amount            :decimal(, )      default(0.0)
#  interes_rate      :decimal(10, 2)   default(0.0)
#  remaining_payment :decimal(, )      default(0.0)
#  paid_amount       :decimal(, )      default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :bigint(8)
#

class Loan < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :fees
  enum period_type: %i[weekly montly]
  validates :interest_rate,
            :amount,
            :remaining_payment,
            :period_number, presence: true
  before_create :calculate_fee, if: -> { weekly? }
  before_create :set_remaining_payment

  private

  def calculate_fee
    self.interest_rate = (1 + interest_rate)**(1.fdiv(4)) - 1
  end

  def set_remaining_payment
    self.remaining_payment = amount
  end
end
