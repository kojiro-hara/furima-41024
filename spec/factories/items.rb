FactoryBot.define do
  factory :item do
    product_name { "Test Product" }
    text { "Test description" }
    category_id { 2 }  # 必要なIDを設定（category_idが1以外）
    state_id { 2 }     # state_idも設定（state_idが1以外）
    burden_id { 2 }    # burden_idも設定（burden_idが1以外）
    prefecture_id { 2 }  # prefecture_idも設定（prefecture_idが1以外）
    days_id { 2 }      # days_idも設定（days_idが1以外）
    price { 500 }      # 価格（300以上、10000000以下）
    association :user  # Userを関連付け

     # 画像の添付
     image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', '蚊.png'), 'image/png') }
  end
end
