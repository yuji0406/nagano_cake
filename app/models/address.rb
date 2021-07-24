class Address < ApplicationRecord
  belongs_to :customer
  
  def postal_code_and_address
    "〒#{self.postal_code.to_s}"+self.address
  end
  
end
