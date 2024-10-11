class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:my_page, :new, :create, :edit]

  def my_page
    @customer = current_user
    render :show
  end
  #変数として渡す@userを今ログインしているユーザーに指定（current_user）

  def show
    @customer = Customer.find(params[:id])
  end

end
