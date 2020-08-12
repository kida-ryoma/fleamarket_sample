class PhoneNumber < ApplicationRecord
  validates :phone_number, presence: true, uniqueness: true
  belongs_to :user
  optional :true
end
