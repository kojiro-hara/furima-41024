FactoryBot.define do
  factory :user do
    nickname              {"test"}
    sequence(:email)      {|n| "test#{n}@test.com"}
    password              {"abc123"}
    password_confirmation {password}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_reading        {"タナカ"}
    first_reading         {"タロウ"}
    birthday              {"2000-01-01"}
  end
end