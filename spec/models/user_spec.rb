require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe "会員情報の新規登録" do
      context '新規登録できる時' do
        it 'nicknameとemail,passwordとpassword_confirmation,last_nameとfirst_name,last_name_kanaとfirst_name_kana,生年月日が存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'passwordとpassword_confirmationが一致していれば登録できる' do
          @user.password = '00000a'
          @user.password_confirmation = '00000a'
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空だと登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "passwordが空だと登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = 'aaaaa1'
          @user.password_confirmation = 'bbbbb1'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
        end

        it "last_nameが空だと登録できない" do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "first_nameが空だと登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")      
        end

        it "last_name_kanaが空だと登録できない" do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")   
        end

        it "first_name_kanaが空だと登録できない" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")   
        end

        it 'last_nameが全角でない場合登録できない' do
          @user.last_name = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")  
        end

        it 'first_nameが全角でない場合登録できない' do
          @user.first_name = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")  
        end

        it 'last_name_kanaが全角カナでない場合登録できない' do
          @user.last_name_kana = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")  
        end

        it 'first_name_kanaが全角カナでない場合登録できない' do
          @user.first_name_kana = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")  
        end
        
        it "birthdayが空だと登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it "emailは@を含まないと保存できない" do
          @user.email = 'testtest.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email:@user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include ("Email has already been taken")
        end

        it 'passwordが全角では登録できないこと' do
          @user.password = 'パスワード'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end

        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '111111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end

        it "passwordが5文字以下では登録できない" do
          @user.password = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
        end

        it 'passwordが半角英数混合(半角英語のみ)では登録できない' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end
      end     
    end
  end
end

