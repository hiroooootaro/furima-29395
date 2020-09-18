FactoryBot.define do
  factory :order_address do
    postal          {"123-1234"}
    prefecture_id   {Faker::Number.between(from: 1,to: 40)}
    city            {Gimei.city.kanji}
    address         {Gimei.town.kanji}
    phone_number    {Faker::Number.number(digits: 11)}
    order_id        {Faker::Number.between(from: 1, to: 100) }
    user_id         {Faker::Number.between(from: 1, to: 100) }
    item_id         {Faker::Number.between(from: 1, to: 100) }
  end
end