require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系（新規登録が成功する）' do
      it 'すべての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常系（新規登録が失敗する）' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したメールアドレスでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@が含まれていない場合は登録できない' do
        @user.email = 'testexample.com' # '@' を含まないメールアドレス
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが一致しなければ登録できない' do
        @user.password_confirmation = 'different123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordに全角文字を含む場合は登録できない' do
        @user.password = 'Password123あ'  # 全角文字（あ）を含むパスワード
        @user.password_confirmation = 'Password123あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'family_nameに半角文字が含まれている場合は登録できない' do
        @user.family_name = '山田Yamada'  # 姓に半角文字（Yamada）が含まれている
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameに半角文字が含まれている場合は登録できない' do
        @user.first_name = '太郎Taro'  # 名に半角文字（Taro）が含まれている
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'family_readingが空では登録できない' do
        @user.family_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family reading can't be blank"
      end
      it 'family_readingがカタカナ以外では登録できない' do
        @user.family_reading = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family reading is invalid"
      end
      it 'first_readingが空では登録できない' do
        @user.first_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First reading can't be blank"
      end
      it 'first_readingがカタカナ以外では登録できない' do
        @user.first_reading = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "First reading is invalid"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
  describe 'ユーザーログイン' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'emailが空ではログインできない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空ではログインできない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
  end
end
