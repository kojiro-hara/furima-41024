require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  context '内容に問題ない場合' do
    it "priceとtokenがあれば保存ができること" do
      expect(@buy).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @buy.price = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Price can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end
  end
end
