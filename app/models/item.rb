class Item < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :order_items
  belongs_to :genre

  validates :genre_id,:name,:image_id,:introduction,:price,:is_active,presence: true

  def tax
    1.1
  end

  def tax_price
    (self.price*tax).floor
  end



end
