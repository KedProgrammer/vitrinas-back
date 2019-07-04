class V1::Admin::RowMaterialsController < ApplicationController

  def update
    row_material = RowMaterial.find([params[:id]])
    row_material.update!(price: row_material_params[:price])
    render json: row_material
  end

  private

  def row_material_params
    params.require(:row_material).permit(:price)
  end
end
