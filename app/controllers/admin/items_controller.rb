class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '商品登録に成功しました'
      redirect_to admin_items_path
    else
      flash[:alert] = '商品の登録に失敗しました'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = '更新に成功しました'
      redirect_to admin_item_path(@item.id)
    else
      flas[:alert] = '更新に失敗しました'
      render :edit
    end
  end

    def destroy
      item = Item.find(params[:id])
      if item.destroy
        flash[:notice] = '商品の削除に成功しました'
        redirect_to admin_items_path
      else
        flash[:alert] = '商品の削除に失敗しました'
        render :edit
      end
    end




  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image)
  end


end
