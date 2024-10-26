class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
  end

  def confirm
    if params[:order][:address_id] == "new_address"
      # 新しい住所情報を使用
      @order = Order.new(order_params)
    elsif params[:order][:address_id] == "registered_address"
      # 登録された住所を使用
      @address = Address.find(params[:order][:address_id])
      @order = Order.new(order_params)
      @order.assign_attributes(postal_code: @address.postal_code, address: @address.address, name: @address.name)
    else
      # 自身の住所を使用
      @order = Order.new(order_params)
      @order.assign_attributes(postal_code: current_customer.postal_code, address: current_customer.address, name: "#{current_customer.first_name} #{current_customer.last_name}")
    end

  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :address_id)
  end

end
