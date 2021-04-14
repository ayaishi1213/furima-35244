FactoryBot.define do
  factory :item do
    name                        {Faker::Lorem.word}
    description                 {Faker::Lorem.sentence}
    details_status_id           {Faker::Number.between(from: 2, to: 7)}
    details_category_id         {Faker::Number.between(from: 2, to: 11)}
    shopping_charge_id          {Faker::Number.between(from: 2, to: 3)}
    shipping_area_id            {Faker::Number.between(from: 2, to: 48)}
    delivery_time_id            {Faker::Number.between(from: 2, to: 4)}
    price                       {10000}
    image                       {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
