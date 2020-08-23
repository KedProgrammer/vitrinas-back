class AddTotalPayedToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :total_payed, :bigint
  end
end
