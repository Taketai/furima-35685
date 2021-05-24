class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show

  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :judgement_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end

end
