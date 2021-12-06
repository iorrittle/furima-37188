class PurchaseRecordsSending
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /^(0{1}\d{9,10})$/,message:"is too short","is invalid. Input only number"}
    
    validates :user_id
    validates :item_id
    #validates :purchase_record_id
    validates :city
    validates :address
  end  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase_records = PurchaseRecords.create(item: item_id, user: user_id)

    Sending.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone_number: telephone_number, purchase_records_id: purchase_records.id)


  end

end  