class AddReferencesToRowMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :row_materials, :category_row_material_id, :integer, foreign_key: true
  end
end
