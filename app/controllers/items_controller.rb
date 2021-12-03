class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :ship_date_id).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  

end

