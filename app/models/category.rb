class Category < ApplicationRecord
  validates :name, presence: true
  has_many :itmes
  has_ancestry
end
