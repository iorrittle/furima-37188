class PurchaseRecordsController < ApplicationController
  
  def index
    @purchase_records_sending = PurchaseRecordsSending.new
    @item = Item.find(params[:item_id])
  end  
  
  
  #def new
  #end  
  
  
  def create
    ＠purchase_records_sending = PurchaseRecordsSending.new(purchase_record_params)
    if @purchase_records_sending.valid?
      @purchase_records_sending.save
      redirect_to root_path
    else
      render :new
    end
  end  
  
  private
  
  def purchase_record_params
    params.require(:purchase_records_sending).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

    

  


