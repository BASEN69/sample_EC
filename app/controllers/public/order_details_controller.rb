class Public::OrderDetailsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @order = current_customer.orders

  end

  def show
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
  end
end
