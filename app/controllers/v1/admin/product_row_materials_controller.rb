class V1::Admin::ProductRowMaterialsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    row_material = RowMaterial.find(params[:row_material_id])
    product.product_row_materials.create(row_material: row_material, quantity: product_row_materials_params[:quantity])
    render json: product
  end

  def update
    product_row_material = ProductRowMaterial.find(params[:id])
    product_row_material.update!(product_row_materials_params)
    render json: product_row_material.product
  end

  def destroy
    product_row_material = ProductRowMaterial.find(params[:id])
    product = product_row_material.product
    product_row_material.destroy
    render json: product
  end

  private

  def product_row_materials_params
    params.require(:product_row_material).permit(:quantity)
  end
end
