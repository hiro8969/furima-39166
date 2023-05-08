require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空の場合は出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end
      it 'カテゴリーが「---」の場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end
      it '商品の状態が空の場合は出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を選択してください")
      end
      it '商品の状態が「---」の場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を選択してください")
      end
      it '配送料の負担が空の場合は出品できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '配送料の負担が「---」の場合は出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost を選択してください")
      end
      it '発送元の地域が空の場合は出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end   
      it '発送元の地域が「---」の場合は出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を選択してください")
      end    
      it '発送までの日数が空の場合は出品できない' do
        @item.shipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end
      it '発送までの日数が「---」の場合は出品できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time を選択してください")
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300~¥9,999,999の間でないと保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it '価格が¥300~¥9,999,999の間でないと保存できない' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end     
      it '価格が半角でないと保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end