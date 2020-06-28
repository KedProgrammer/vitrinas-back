class RenvameColumnToloan < ActiveRecord::Migration[5.2]
  def change
    rename_column :loans, :interes_rate, :interest_rate
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
