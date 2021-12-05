class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :update]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
    
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
  
  def show
  end  

  def edit
  end  

  def update
    
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit  
    
    end
  end  

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end
  
  
  private
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :ship_date_id).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end  

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
  


end

