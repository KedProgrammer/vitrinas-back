class ChangeColumn1 < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :client_number, :bigint
  end
end
