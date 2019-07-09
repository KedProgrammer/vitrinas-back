class V1::Admin::ProductsController < ApplicationController

  def update
    product = Product.find(params[:id])
    product.update!(product_params)
    render json: product
  end

  def update_all
    products = Product.all 
    products.update_all(product_params)
    render json: products
  end

  def create
    category_product = CategoryProduct.find(params[:category_product_id])
    category_product.products.create(product_params)
    render json: category_product
  end

private 

def product_params
  params.require(:product).permit(:profit_rate, :name, :category_product_id, :code)
end
end
