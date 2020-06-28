class ChangeBalanceTofee < ActiveRecord::Migration[5.2]
  def change
    change_column :fees, :balance, :decimal, precision: 20, scale: 10
  end
end
