class V1::Orders::InProcessOrders < V1::Orders::OrdersController
  
  def update
    @order = Order.find(params[:id])
    @order.update!(order_params)
    render json: @order
  end

  private
  def order_params
    params.require(:order).permit(:initial_date,:bill_number,:comments,
      :client_name,:client_number,:total)
  end
end