class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_many :orders,dependent: :destroy

  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,presence: true


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
