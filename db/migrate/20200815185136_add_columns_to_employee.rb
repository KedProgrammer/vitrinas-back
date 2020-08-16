class AddColumnsToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :initial_date, :date, default: Date.current, null: false
    add_column :employees, :email, :string, default: '', null: false
    add_column :employees, :cellphone, :string, default: '', null: false
    add_column :employees, :last_name, :string, default: '', null: false
    add_column :employees, :identification, :string, default: '', null: false
    add_column :employees, :job_position, :string, default: '', null: false
  end
end
