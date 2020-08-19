class DeliveryDestination < ApplicationRecord
  validates :delivery_family_name, presence: true,     format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。'}
  validates :delivery_first_name, presence: true,      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。'}
  validates :delivery_family_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :delivery_first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  belongs_to :user, optional: true

end
