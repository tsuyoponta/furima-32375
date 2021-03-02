FactoryBot.define do
  factory :buy_address do
    postal_code         { '123-4567' }
    source_area_id      { Faker::Number.within(range: 2..48) }
    city                { Gimei.city.kanji }
    block               { Gimei.town.kanji }
    phone_number        { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }
    user_id             { Faker::Number.within(range: 1..99) }
    item_id             { Faker::Number.within(range: 1..99) }
  end
end
