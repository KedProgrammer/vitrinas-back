class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.decimal :interes_rate, precision: 10, scale: 2, default: 0
      t.decimal :remaining_payment, precision: 10, scale: 2, default: 0
      t.decimal :paid_amount, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
