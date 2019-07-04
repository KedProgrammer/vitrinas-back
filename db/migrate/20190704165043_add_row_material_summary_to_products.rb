class AddRowMaterialSummaryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :row_material_summary, :string
  end
end
