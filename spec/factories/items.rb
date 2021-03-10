FactoryBot.define do
  factory :item do


    product { 'ああああ' }
    category_id { 2 }
    price { 2 }
    status_id { 2 }
    delivery_id { 2 }
    area_id { 2 }
    day_id { 2 }
    description { 'あああああああああああああああああああ' }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_sample.jpg'), filename: 'test_sample.jpg')
    end

  end
end
