FactoryBot.define do
  factory :user do
    nick_name             {"ガッキー"}
    email                 {Faker::Internet.free_email}
    family_name           {"新垣"}
    first_name            {"結衣"}
    family_name_kana      {"アラガキ"}
    first_name_kana       {"ユイ"}
    birthday              {"1988-06-21"}
    password =            Faker::Internet.password(min_length: 7)
    password              {password}
    password_confirmation {password}
    introduction          {Faker::JapaneseMedia::OnePiece.quote}
  end
end