class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index

  end

  # def show
  # end

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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :judgement_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end

end
