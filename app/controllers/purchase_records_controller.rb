class PurchaseRecordsController < ApplicationController
  def index
    @purchase_records_sending = PurchaseRecordsSending.new
  end  
  
  
  #def new
  #end  
  
  
  def create
    Purchase_Record.create(purchase_record_params)
   
  end  
  private
  def purchase_record_params
    



end
