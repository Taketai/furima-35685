class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def show

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

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  def gaiyou

  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :judgement_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_root_path
    if current_user.id != @item.user_id
      redirect_to root_path
    else
      if @item.order != nil
        redirect_to root_path    
      end
    end
  end
end
