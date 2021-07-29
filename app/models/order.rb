class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  enum status: ["入金待ち","入金確認","製作中","発送準備中","発送済み"]
  enum payment: ["クレジットカード","銀行振込"]

  validates :customer_id,:postal_code,:name,:postage,:payment,:status,:total_price,:order_address,presence: true

  def postal_code_and_address
    "〒#{self.postal_code.to_s}"+"　"+self.order_address
  end

end
