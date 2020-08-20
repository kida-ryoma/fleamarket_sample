FactoryBot.define do
  factory :phone_number do
    number    {Faker::Number.number(digits: 11)}
  end
end