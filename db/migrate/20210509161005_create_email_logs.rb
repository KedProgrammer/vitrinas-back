class CreateEmailLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :email_logs do |t|
      t.string :sent_to

      t.timestamps
    end
  end
end
