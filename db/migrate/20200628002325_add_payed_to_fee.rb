class AddPayedToFee < ActiveRecord::Migration[5.2]
  def change
    add_column :fees, :status, :integer, default: 0, null: false
  end
end
