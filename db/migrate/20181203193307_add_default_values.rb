class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column :loans, :amount, :decimal, default: 0.0
    change_column :loans, :remaining_payment, :decimal, default: 0.0
    change_column :loans, :paid_amount, :decimal, default: 0.0
  end
end
