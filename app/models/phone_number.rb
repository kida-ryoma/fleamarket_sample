class PhoneNumber < ApplicationRecord
  validates :number, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: 'をハイフンなしの11桁で入力してください。'}
  belongs_to :user, optional: true
end
