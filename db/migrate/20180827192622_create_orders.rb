class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :initial_date
      t.bigint :bill_number
      t.string :comments
      t.string :aasm_state
      t.string :client_name
      t.integer :client_number
      t.bigint :total

      t.timestamps
    end
  end
end
