FactoryBot.define do
  factory :item do
    name    {"新垣結衣（写真集）"}
    price   {333}
    description { Faker::Lorem.sentence }
    sales_status     {1}
    size        {"M"}
    brand    {"エルメス"}
    prefecture_code {38}
    category_id {27}
    status_id {3}
    user_id {1}
    delivery_responsibility_id {1}
    preparation_day_id {1}
  end
end