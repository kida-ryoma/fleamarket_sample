class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  has_one :profile
  has_one :delivery_destination
  has_one :credit_card
  has_many :items
  has_many :seller_orders, class_name: 'Order', foreign_key: 'seller_id'
  has_many :buyer_orders, class_name: 'Order', foreign_key: 'buyer_id'
  has_many :sns_credentials

  mount_uploader :image, ImageUploader
end
