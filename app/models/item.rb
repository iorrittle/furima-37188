class Item < ApplicationRecord
  
  belongs_to  :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :ship_date


  
  validates :item_name, presence: true                    
  validates :price, numericality: { greater_than: 300 , less_than: 9_999_999},
  format: { with: /\A[0-9]+\z/ , message: 'Price is invalid.harf-width characters' }
  validates :explanation, presence: true                    
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank"}
end



