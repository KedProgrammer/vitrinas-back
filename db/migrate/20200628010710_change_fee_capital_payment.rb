class ChangeFeeCapitalPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :fees, :capital_payment
    add_column :fees, :capital_payment, :decimal, precision: 20, scale: 9
  end
end
