class V1::Admin::CategoryRowMaterialsController < ApplicationController

  def index
    categories = Catetegory.all
    render json: categories, include: 'category.row_materials'
  end
end
