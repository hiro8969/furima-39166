require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入記録の保存' do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
  end
  context '商品購入登録できる場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@buy_address).to be_valid
    end
    it '建物名が空でも購入できること' do
      @buy_address.building_name = ''
      expect(@buy_address).to be_valid
    end
  end
    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @buy_address.post_code = '123-123４'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @buy_address.prefecture_id = '0'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '都道府県が空の場合は購入できないこと' do
        @buy_address.prefecture_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '市区町村が空だと購入できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @buy_address.phone_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @buy_address.phone_number = '090123456'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it '電話番号が12桁以上だと購入できない' do
        @buy_address.phone_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @buy_address.phone_number = '０9012341234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      #   end
      end
    end
  end
end
