class PreparationDay < ApplicationRecord
  validates :preparation_days, presence: true
  has_many :items
end
