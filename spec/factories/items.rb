FactoryBot.define do
  factory :item do
    item_name        { 'パソコン' }
    description      { '未使用のパソコンです' }
    category_id      { 2 }
    condition_id     { 2 }
    shipping_cost_id { 2 }
    shipping_time_id { 2 }
    price            { 5000 }
    prefecture_id    { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end