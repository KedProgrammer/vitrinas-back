class ChangeInterestRateToFees < ActiveRecord::Migration[5.2]
  def change
    change_column :loans, :interest_rate, :decimal, precision: 10, scale: 8
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
