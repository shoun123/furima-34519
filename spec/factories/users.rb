FactoryBot.define do
  factory :user do

    nickname { '田中くん' }
    last_name { '田中' }
    first_name { '太郎' }
    last_furigana { 'タナカ' }
    first_furigana { 'タロウ' }
    birthday { '19800410' }

    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)

    password_confirmation { password }

  end
end


