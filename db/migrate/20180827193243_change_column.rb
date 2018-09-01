class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :comments, :text
  end
end
