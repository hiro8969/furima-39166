require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it 'nicknameが空だと登録できない.必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない.必須であること' do
      @user.email = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    # it 'メールアドレスが一意性であること' do
    # end
    # it 'メールアドレスは、@を含む必要があること' do
    # end
    # it 'パスワードが必須であること' do
    # end
    # it 'パスワードは、6文字以上での入力が必須であること' do
    # end
    # it 'パスワードは、半角英数字混合での入力が必須であること' do
    # end
    # it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
    # end    
  end
  # describe 'ユーザー新規登録/本人情報確認' do
  #   it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
  #   end
  #   it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
  #   end
  #   it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
  #   end
  #   it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
  #   end
  #   it '生年月日が必須であること' do
  #   end
  # end
end

#   bundle exec rspec spec/models/user_spec.rb