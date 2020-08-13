class DeliveryDestination < ApplicationRecord
  validates :delivery_family_name, presence: true
  validates :delivery_first_name, presence: true
  validates :delivery_family_name_kana, presence: true
  validates :delivery_first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  
  belongs_to :user, optional: true
end
