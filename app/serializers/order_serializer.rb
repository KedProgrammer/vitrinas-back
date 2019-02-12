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

class OrderSerializer < ActiveModel::Serializer
  attributes :id,
            :bill_number,
            :comments,
            :aasm_state,
            :client_name,
            :client_number,
            :initial_date,
            :updated_at,
            :description,
            :seller_name,
            :description,
            :order_number,
            :place,
            :delivery_date
end
