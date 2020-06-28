class RemoveColumnToFees < ActiveRecord::Migration[5.2]
  def change
    remove_column :fees, :decimal
    rename_column :fees, :interes_rate, :interest_amount
  end
end
