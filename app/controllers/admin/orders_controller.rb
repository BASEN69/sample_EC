class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index

  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_detail_path(@order), notice: 'statusが更新されました'
    else
      render :back
    end
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end
end
