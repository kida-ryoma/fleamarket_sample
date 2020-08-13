class PhoneNumber < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  belongs_to :user, optional: true
  optional :true
end
