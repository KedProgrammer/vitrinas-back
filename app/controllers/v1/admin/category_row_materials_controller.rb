class V1::Admin::CategoryRowMaterialsController < ApplicationController

  def index
    categories = CategoryRowMaterial.all
    render json: categories, include: 'row_materials'
  end
end
