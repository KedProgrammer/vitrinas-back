class AddFeeValueToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :fee_value, :decimal, default: 0.0, null: false
  end
end
