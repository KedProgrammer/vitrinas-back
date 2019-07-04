class CreateProductRowMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :product_row_materials do |t|
      t.references :product, foreign_key: true
      t.references :row_material
      t.integer :quantity

      t.timestamps
    end
  end
end
