class V1::Admin::CategoryProductsController < ApplicationController

  def index
    categories = CategoryProduct.all
    render json: categories, include: 'products'
  end

  def create
    category_product = CategoryProduct.create(category_product_params)
    render json: category_product
  end

  private

  def category_product_params
    params.require(:category_product).permit(:name)
  end

end