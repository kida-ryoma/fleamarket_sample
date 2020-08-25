class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :item_images, presence:true
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

  def self.search(search)
    Item.where('name LIKE(?) OR brand LIKE(?)', "%#{search}%","%#{search}%")
  end
end
