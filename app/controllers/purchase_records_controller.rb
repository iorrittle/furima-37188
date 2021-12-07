class PurchaseRecordsController < ApplicationController
  
  def index
    @purchase_records_sending = PurchaseRecordsSending.new
    @item = Item.find(params[:item_id])
    unless current_user && (@item.purchase_record == nil)
      return redirect_to root_path
    end   

  
  end  
  
  
  def new
    @purchase_records_sending = PurchaseRecordsSending.new
  end  
  
  
  def create
   
    @item = Item.find(params[:item_id])
    @purchase_records_sending = PurchaseRecordsSending.new(purchase_record_params)
    if @purchase_records_sending.valid?
      
      pay_item
      @purchase_records_sending.save
      
      return redirect_to root_path
    else
      render :index
    end
  end  
  
  private
  
  def purchase_record_params
    params.require(:purchase_records_sending).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],    
      currency: 'jpy'                 
    )
  end

  



end

    

  


