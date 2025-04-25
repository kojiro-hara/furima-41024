FactoryBot.define do
  factory :buy_shipping do
    post_code_id { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    property { '東京ハイツ' }
    telephone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end
