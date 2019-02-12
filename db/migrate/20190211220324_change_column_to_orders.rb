class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :delivery_date, :datetime
  end
end
