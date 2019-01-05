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

require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
