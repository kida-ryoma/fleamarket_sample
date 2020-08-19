FactoryBot.define do
  factory :delivery_destination do
    delivery_family_name      {"孫"}
    delivery_fisrt_name       {"悟天"}
    delivery_family_name_kana {"ソン"}
    delivery_first_name_kana  {"ゴテン"}
    delivery_phone_number     {Faker::PhoneNumber.phone_number}
    post_code                 {Faker::Address.postcode}
    prefecture_code           {1}
    city                      {Faker::Address.city_suffix}
    house_number              {Faker::Address.street_address}
    building_name             {Faker::Address.building_number}
    user_id                   {1}
  end
end