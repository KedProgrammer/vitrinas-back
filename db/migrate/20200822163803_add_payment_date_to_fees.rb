class AddPaymentDateToFees < ActiveRecord::Migration[5.2]
  def change
    add_column :fees, :payment_date, :date
  end
end
