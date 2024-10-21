class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:my_page, :edit]

  def my_page
    @customer = current_customer
    render :show
  end
  #変数として渡す@customerを今ログインしているユーザーに指定（current_customer）

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end


end
