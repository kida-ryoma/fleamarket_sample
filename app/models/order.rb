class Order < ApplicationRecord
  validates :seller_id, presence: true
  validates :buyer_id, presence: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :item, optional: true
end
