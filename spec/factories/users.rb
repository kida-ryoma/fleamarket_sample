FactoryBot.define do
  factory :user do
    nick_name    {"新垣結衣"}
    email {Faker::Internet.free_email}
    family_name {"新垣"}
    first_name {"ゆい"}
    family_name_kana {"アラガキ"}
    first_name_kana {"ユイ"}
    birthday {"1990-08-24"}
    password = Faker::Internet.password(min_length: 7)
    password {password}
    password_confirmation {password}
    introduction     {Faker::Movies::HarryPotter.quote}
  end
end