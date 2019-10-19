class ChangeQuantityToProductRowMaterial < ActiveRecord::Migration[5.2]
  def change
    change_column :product_row_materials, :quantity, :decimal, precision: 10, scale: 2, default: 0
  end
end
