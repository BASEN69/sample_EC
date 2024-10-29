class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if @order.order_details.all? { |detail| detail.making_status == "makeup" }
        @order.update(status: "sendup")
      end
      redirect_to admin_order_detail_path(@order), notice: 'ステータス更新'
    else
      render :show, alert: '更新に失敗しました'
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
