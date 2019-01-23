class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.decimal :value
      t.string :capital_payment
      t.string :decimal
      t.decimal :interes_rate
      t.decimal :balance
      t.integer :fee_number

      t.timestamps
    end
  end
end
