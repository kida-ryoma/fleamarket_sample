class Status < ApplicationRecord
  validates :status, presence: true
  has_many :items
end
