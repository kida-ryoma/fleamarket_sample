class CreditCard < ApplicationRecord
  validates :customer_id, presence: true
  validates :card_id, precence: true

  belongs_to :user
end
