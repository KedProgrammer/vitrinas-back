class V1::Orders::OrdersController < ApplicationController
  def create
    @order = Order.create!(order_params)
    render json: @order
  end

  def index
    if params[:search].present?
      @order = Order.find(params[:number].to_i) if params[:search].to_i == 0
      @order = Order.find_by!(bill_number: params[:number]) if  params[:search].to_i == 1
      render json: @order
    else
      @orders = Order.searh_orders_by_range(params[:start_date], params[:end_date]) if params[:start_date]
      @orders = Order.search_orders(params[:date]) if params[:date]
      render json: @orders
    end
  end

  def update
    @order = Order.find(params[:id])
    if params[:state]
      @order.change_state(params[:state])
    else
      @order.update!(order_params)
    end
    render json: @order
  end

  private
  def order_params
    params.require(:order).permit(:initial_date,:bill_number,:comments,
      :client_name,:client_number,:total)
  end
end
