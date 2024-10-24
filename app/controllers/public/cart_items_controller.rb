class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:destroy]

  def create
    @cart_item = CartItem.find_or_initialize_by(item_id: params[:item_id], customer_id: current_customer.id)

    if @cart_item.persisted?
      @cart_item.amount += params[:amount].to_i
    else
      @cart_item.amount = params[:amount].to_i
    end

    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to cart_items_path
    else
      flash[:alert] = "カートに追加できませんでした"
      redirect_to items_path
    end
  end

  def index
    @cart_items = current_customer.cart_items.includes(:item)
  end

  def destroy
    @cart_item.destroy
    flash[:notice] = 'カートから削除しました'
    redirect_to cart_items_path
  end

  # すべてのアイテムを削除するアクション
  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カート内のすべてのアイテムが削除されました"
    redirect_to cart_items_path
  end

  private

  # カートアイテムを設定するメソッド
  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

end
