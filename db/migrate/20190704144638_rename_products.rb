class RenameProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :price, :cost
  end
end
