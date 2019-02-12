class OrdersSerializer < ActiveModel::Serializer
  attributes :id,
            :bill_number,
            :comments,
            :aasm_state,
            :client_name,
            :client_number,
            :total,
            :initial_date,
            :order_number,
            :delivery_date
end