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

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = '更新に成功しました'
      redirect_to mypage_path
    else
      flash[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def withdraw
    current_customer.update(is_active: false)
    reset_session #セッションをリセットしてログアウトさせる
    flash[:notice] = "退会処理が完了しました"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end


end
