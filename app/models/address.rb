class Address < ApplicationRecord
  belongs_to :customer
  
  validates :customer_id,:name,:postal_code,:address,presence: true

  def postal_code_and_address
    "〒#{self.postal_code.to_s}"+" "+self.address
  end

  def postal_code_and_address_and_name
    "〒#{self.postal_code.to_s}"+"　"+self.address+"　"+self.name
  end

end
