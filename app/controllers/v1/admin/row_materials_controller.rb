class V1::Admin::RowMaterialsController < ApplicationController

  def update
    row_material = RowMaterial.find(params[:id])
    row_material.update!(row_material_params)
    category_row_material = row_material.category_row_material
    render json: category_row_material
  end

  def create
    category_row_material = CategoryRowMaterial.find(params[:category_row_material_id])
    category_row_material.row_materials.create(row_material_params)
    render json: category_row_material
  end

  private

  def row_material_params
    params.require(:row_material).permit(:price, :code, :unity, :name, :category_row_material_id)
  end
end
