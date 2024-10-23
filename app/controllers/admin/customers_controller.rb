class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "#{@customer.first_name}#{@customer.last_name}の変更が完了しました"
    else
      flash[:alert] = "変更に失敗しました"
    end
    redirect_to admin_customers_path
  end

  private


  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end