class AddTypeToCateogry < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :type, :string
  end
end
