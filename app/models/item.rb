class Item < ApplicationRecord
  
  belongs_to  :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice

  validates :choice_id, numericality: { other_than: 1 } 

end
