require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品ができる時' do
        it '必要な情報が適切に入力されると、商品出品ができること' do
          expect(@item).to be_valid
        end
      end

      context '商品出品ができない時' do
        it '商品画像を1枚添付しないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
  
        it '商品名が空だと出品できない' do
           @item.name = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Name can't be blank")
        end
  
        it '商品の説明が空だと出品できない' do
           @item.description = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Description can't be blank")
        end
  
        it 'カテゴリーの情報が空だと出品できない' do
           @item.details_category_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Details category を選択してください")
        end
  
        it '商品の状態が空だと出品できない' do
           @item.details_status_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Details status を選択してください")        
        end
  
        it '配送料の負担が空だと出品できない' do
           @item.shopping_charge_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Shopping charge を選択してください") 
        end
  
        it '発送もとの地域についての情報が空だと出品できない' do
           @item.shipping_area_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Shipping area を選択してください") 
        end
  
        it '発送までの日数についての情報が空だと出品できない' do
           @item.delivery_time_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Delivery time を選択してください")         
        end
  
        it '販売価格が空だと出品できない' do
          @item.price  = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で300~9,999,999円で設定してください")
        end

        it '販売価格は半角数字のみでないと出品できない'do
          @item.price  = '１１１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で300~9,999,999円で設定してください")
        end

        it '販売価格は300〜9,999,999円でないと出品できない'do
          @item.price  = 99999999999999999
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で300~9,999,999円で設定してください")
        end

        it '値段が半角英数混合では登録できないこと' do
          @item.price  = '1a1a1a1a1a'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で300~9,999,999円で設定してください")          
        end

        it '値段が半角英語だけでは登録できないこと' do
          @item.price  = 'aaaaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で300~9,999,999円で設定してください")          
        end

        it '値段が299円以下の場合は登録できない' do
          @item.price  = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で300~9,999,999円で設定してください")    
        end

        it 'カテゴリーが1の場合は登録できない' do
          @item.details_category_id  = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Details category を選択してください")          
        end

        it '商品の状態が1の場合は登録できない' do
          @item.details_status_id  = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Details status を選択してください")        
        end

        it '配送料の負担が1の場合は登録できない' do
          @item.shopping_charge_id  = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping charge を選択してください")           
        end

        it '発送までの日数が1の場合は登録できない' do
          @item.delivery_time_id  = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery time を選択してください")          
        end

        it '発送元の地域が1の場合は登録できない' do
          @item.shipping_area_id  = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area を選択してください")           
        end
      end
    end
  end
end







