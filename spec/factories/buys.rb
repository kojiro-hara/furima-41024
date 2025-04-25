FactoryBot.define do
  factory :buy do
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    user
    item
  end
end
