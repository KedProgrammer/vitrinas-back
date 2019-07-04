class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :profit_rate, :decimal
  end
end
