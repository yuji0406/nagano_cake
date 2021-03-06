class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status:["製作不可","製作待ち","製作中","製作完了"]

  validates :order_id,:item_id,:amount,:price,:status,presence: true
  def tax
    1.1
  end

  def tax_price
    (self.price*tax).floor
  end



end
