class AddUnityToRowMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :row_materials, :unity, :string
  end
end
