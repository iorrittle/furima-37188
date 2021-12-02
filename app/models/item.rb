class Item < ApplicationRecord
  
  belongs_to  :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice

  validates :user,              null: false, foreign_key: true  
  validates :item_name,         null: false                     
  validates :price,             null: false
  validates :explanation,       null: false                    
  validates :category_id,       null: false                     
  validates :condition_id,      null: false                     
  validates :delivery_fee_id,   null: false                     
  validates :prefecture_id,     null: false                     
  validates :ship_date_id,      null: false




  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}

end


end