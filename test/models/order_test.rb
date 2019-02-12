# == Schema Information
#
# Table name: orders
#
#  id            :bigint(8)        not null, primary key
#  initial_date  :datetime
#  bill_number   :bigint(8)
#  comments      :text
#  aasm_state    :string
#  client_name   :string
#  client_number :bigint(8)
#  total         :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  place         :integer
#  delivery_date :datetime
#  seller_name   :string
#  description   :text
#  order_number  :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
