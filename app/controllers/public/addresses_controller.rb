class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!
   before_action :set_customer  # 顧客情報を取得
   before_action :ensure_current_customer

  def index
    @addresses = @customer.addresses
    @new_address = Address.new
  end

  def create
    @new_address = current_customer.addresses.new(address_params)
    if @new_address.save
      flash[:notice] = '配送先の登録に成功しました'
      redirect_to customer_addresses_path(@customer)
    else
      flash[:alert] = '配送先の登録に失敗しました'
      render :index
    end
  end

  def edit
    @address = @customer.addresses.find(params[:id])
  end

  def update
    @address = @customer.addresses.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = '配送先の更新に成功しました'
      redirect_to customer_addresses_path(@customer)
    else
      flash[:alert] = '配送先の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = '削除に成功しました'
      redirect_to customer_addresses_path
    end
  end

  private


  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def ensure_current_customer
    if @customer != current_customer
      flash[:alert] = "他のユーザーのページにはアクセスできません"
      redirect_to mypage_path(current_customer)
    end
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end


end
