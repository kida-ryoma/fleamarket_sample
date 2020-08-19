FactoryBot.define do
  factory :phone_number do
    number    {Faker::PhoneNumber.phone_number}
  end
end