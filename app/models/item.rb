class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  belongs_to :category
  belongs_to :status
  belongs_to :user
  belongs_to :delivery_responsibility
  belongs_to :preparation_day
  has_one :order, dependent: :destroy
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  include JpPrefecture
  jp_prefecture :prefecture_code
end
