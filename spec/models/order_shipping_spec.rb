require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1  #createが2個あるので、処理の読み込みを、あえて遅くするメソッド
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it '全ての入力内容に問題がなければ商品を購入できる' do
        expect(@order_shipping).to be_valid
      end

      it '建物名は入力がなくても商品を購入できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '入力内容に問題があり購入できない時' do
      it 'tokenが空では購入できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号の入力がないと購入できないこと' do
        @order_shipping.postcode = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号が"3桁-4桁"の入力でないと購入できないこと' do
        @order_shipping.postcode = '11-11'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postcode is invalid")
      end

      it '都道府県の入力がないと購入できないこと' do
        @order_shipping.shipping_area_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市区町村の入力がないと購入できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地の入力がないと購入できないこと' do
        @order_shipping.bloc = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Bloc can't be blank")
      end

      it '電話番号の入力がないと購入できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁未満購入できないこと' do
        @order_shipping.phone_number = '090111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
