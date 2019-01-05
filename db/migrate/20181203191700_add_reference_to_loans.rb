class AddReferenceToLoans < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :employee, foreign_key: true
    add_reference :fees, :loan, foreign_key: true
  end
end
