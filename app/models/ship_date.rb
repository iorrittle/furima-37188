class Ship_date < ActiveHash::Base

  include ActiveHash::Associations
  has_many :items

end