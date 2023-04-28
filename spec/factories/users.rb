FactoryBot.define do
  factory :user do
    nickname   { Faker::Name.initials }
    email      { Faker::Internet.free_email }
    password   { 'a1' + Faker::Internet.password(min_length: 4, mix_case: false) }
    password_confirmation { password }
    family_name   { 'やマ田' }
    first_name  { '太ろウ' }
    family_name_kana  { 'ヤマダ' }
    first_name_kana  { 'タロウ' }
    birth_day { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end