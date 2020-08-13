class PreparationDay < ApplicationRecord
  validates :days, presence: true
  has_many :items
end
