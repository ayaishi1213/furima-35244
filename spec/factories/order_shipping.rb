FactoryBot.define do
  factory :order_shipping do
    token                       {'tok_abcdefghijk00000000000000000'}
    postcode                    {'111-1111'}
    shipping_area_id            {Faker::Number.between(from: 2, to: 48)}
    city                        {"横浜市緑区"}
    bloc                        {"青山1-1-1"}
    building                    {'青山マンション101'}
    phone_number                {'09011111111'}
  end
end