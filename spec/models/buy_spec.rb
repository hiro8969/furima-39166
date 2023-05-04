require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy = FactoryBot.build(:buy, user_id: @user.id, item_id: @item.id)
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@buy).to be_valid
    end
  end

  context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end
  end
end