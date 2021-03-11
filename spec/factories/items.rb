FactoryBot.define do
  factory :item do


    product { 'ああああ' }
    category_id { 2 }
    price { 1000 }
    status_id { 2 }
    delivery_id { 2 }
    area_id { 2 }
    day_id { 2 }
    description { 'あああああああああああああああああああ' }
    user_id { 3 }
    id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_sample.jpg'), filename: 'test_sample.jpg')
    end

  end
end
