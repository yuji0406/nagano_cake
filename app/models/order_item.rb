class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum status:["製作不可","製作待ち","製作中","製作完了"]
end
