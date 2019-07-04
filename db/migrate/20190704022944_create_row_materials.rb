class CreateRowMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :row_materials do |t|
      t.string :name
      t.string :code
      t.decimal :price

      t.timestamps
    end
  end
end
