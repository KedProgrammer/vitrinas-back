class AddPlaceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :place, :integer
    add_column :orders, :delivery_date, :date
    add_column :orders, :seller_name, :string
    add_column :orders, :description, :text
  end
end
