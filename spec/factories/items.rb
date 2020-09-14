FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    description           {Faker::Name.initials(number: 10)}
    price                 {Faker::Number.number(digits: 4)}
    area_id               {Faker::Number.between(from: 1, to: 40) }
    category_id           {Faker::Number.between(from: 2, to: 10) }
    condition_id          {Faker::Number.between(from: 2, to: 6) }
    delivery_fee_id       {Faker::Number.between(from: 2, to: 3) }
    day_id                {Faker::Number.between(from: 2, to: 4) }
    
    association :user, factory: :user    




    
    after(:item) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
