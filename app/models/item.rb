class Item < ApplicationRecord
  attachment :image_id
  
  has_many :cart_items
  has_many :order_items
  belongs_to :genre
end
