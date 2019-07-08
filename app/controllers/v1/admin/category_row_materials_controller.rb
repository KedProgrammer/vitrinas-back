class V1::Admin::CategoryRowMaterialsController < ApplicationController

  def index
    categories = CategoryRowMaterial.all
    render json: categories, include: 'row_materials'
  end

  def create
    category_row_material = CategoryRowMaterial.create(category_row_material_params)
    render json: category_row_material
  end

  private

  def category_row_material_params
    params.require(:category_row_material).permit(:name)
  end

end
