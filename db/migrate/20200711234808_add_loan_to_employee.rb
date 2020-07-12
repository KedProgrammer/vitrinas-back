class AddLoanToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :loan, foreign_key: true
  end
end
