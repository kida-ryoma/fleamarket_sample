class DeliveryResponsibility < ApplicationRecord
  # validates :delivery_responsibility, presence: true
  has_many :items
end
