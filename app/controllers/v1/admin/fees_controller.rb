class V1::Admin::FeesController < ApplicationController
  def update
    fee = Fee.find(params[:id])
    fee.update(fee_params)
    render json: fee
  end

  private

  def fee_params
    params.require(:fee).permit(:status)
  end
end
