class ChangeColumntsToEmployee < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :initial_date, :date
    change_column :employees, :email, :string
    change_column :employees, :cellphone, :string
    change_column :employees, :last_name, :string
    change_column :employees, :identification, :string
    change_column :employees, :job_position, :string 
  end
end
