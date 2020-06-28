class AddPeriodToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :period_number, :integer
    add_column :loans, :period_type, :integer
  end
end
