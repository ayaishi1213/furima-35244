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
           expect(@item.errors.full_messages).to include("Details category can't be blank")
        end
  
        it '商品の状態が空だと出品できない' do
           @item.details_status_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Details status can't be blank")        
        end
  
        it '配送料の負担が空だと出品できない' do
           @item.shopping_charge_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Shopping charge can't be blank") 
        end
  
        it '発送もとの地域についての情報が空だと出品できない' do
           @item.shipping_area_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Shipping area can't be blank") 
        end
  
        it '発送までの日数についての情報が空だと出品できない' do
           @item.delivery_time_id  = ''
           @item.valid?
           expect(@item.errors.full_messages).to include("Delivery time can't be blank")         
        end
  
        it '販売価格が空だと出品できない' do
          @item.price  = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '販売価格は半角数字のみでないと出品できない'do
          @item.price  = '１１１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '販売価格は300〜9,999,999円でないと出品できない'do
          @item.price  = '99999999999999999'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
      end
    end
  end
end







