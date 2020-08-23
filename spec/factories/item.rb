FactoryBot.define do
  factory :item do
    name    {"新垣結衣（写真集）"}
    price   {333}
    description { Faker::Lorem.sentence }
    sales_status     {1}
    size        {"M"}
    brand    {"エルメス"}
    prefecture_code {38}
    category
    status
    user
    delivery_responsibility
    preparation_day
  end
end