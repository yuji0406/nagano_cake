class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :addresses
  has_many :orders
  
  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_active,presence: true


  def full_name
    self.last_name+"　"+self.first_name
  end

  def full_name_kana
    self.last_name_kana+"　"+self.first_name_kana
  end

  def postal_code_and_address
    "〒#{self.postal_code.to_s}"+"　"+self.address
  end
end
