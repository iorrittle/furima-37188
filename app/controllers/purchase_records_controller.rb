class PurchaseRecordsController < ApplicationController
  def new
    
  end  
  
  
  def create
    Purchase_Record.create(purchase_record_params)
   
  end  
  private
  def purchase_record_params
    params.
    


end
