require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id, token: 'tok_abcdefghijk00000000000000000', telephone: '09012345678')
  end

  describe '寄付情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_shipping).to be_valid
      end

      it 'propertyは空でも保存できること' do
        @buy_shipping.property = ''
        expect(@buy_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_code_idが空だと保存できないこと' do
        @buy_shipping.post_code_id = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_code_idが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_shipping.post_code_id = '1234567'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @buy_shipping.prefecture_id = 0
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @buy_shipping.city = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @buy_shipping.house_number = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephoneが空だと保存できないこと' do
        @buy_shipping.telephone = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneが9桁以下だと保存できないこと' do
        @buy_shipping.telephone = '123456789'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Telephone is too short")
      end

      it 'telephoneが12桁以上だと保存できないこと' do
        @buy_shipping.telephone = '123456789012'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Telephone Input only number")
      end

      it 'telephoneに半角数字以外が含まれていると保存できないこと' do
        @buy_shipping.telephone = '090-1234-5678'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Telephone Input only number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @buy_shipping.user_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @buy_shipping.item_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @buy_shipping.token = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
