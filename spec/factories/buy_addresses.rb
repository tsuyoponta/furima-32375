FactoryBot.define do
  factory :buy_address do
    postal_code         { '123-4567' }
    source_area_id      { 24 }
    city                { 'テスト市' }
    block               { 'サンプル123' }
    phone_number        { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
