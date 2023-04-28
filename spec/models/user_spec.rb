require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規作成できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailで@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordで半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordで半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａａa １１1'
        @user.password_confirmation = 'ａａa １１1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'お名前(全角)は、名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前(全角)は、名字を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end

      it 'お名前(全角)は、名前を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'お名前カナ(全角)は、名字を全角（カタカナ）で入力しないと登録できない' do
        @user.family_name_kana = ' ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角カタカナのみで入力して下さい')
      end

      it 'お名前カナ(全角)は、名前を全角（カタカナ）で入力しないと登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end

      it '生年月日が空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end

#   bundle exec rspec spec/models/user_spec.rb
# require 'rails_helper'
# RSpec.describe User, type: :model do
#   before do
#     @user = FactoryBot.build(:user)
#   end

#   describe "ユーザー新規登録" do
#     context '新規登録できる場合' do
#       it '必要事項を全て過不足なく入力すると登録できる' do
#         expect(@user).to be_valid
#         binding.pry
#       end
#     end
#     context '新規作成できない場合' do
#     it 'nicknameが必須であること' do
#       @user.nickname = ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Nickname can't be blank")
#     end
#     it 'emailが必須であること' do
#       @user.email = ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Email can't be blank")
#     end
#     it 'メールアドレスが一意性であること' do
#       @user.save
#       another_user = FactoryBot.build(:user, email: @user.email)
#       another_user.valid?  
#       expect(another_user.errors.full_messages).to include('Email has already been taken')
#     end
#     it 'メールアドレスは、@を含む必要があること' do
#         @user.email = 'testmail'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Email is invalid')
#     end
#     it 'パスワードが必須であること' do
#         @user.password = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Password can't be blank")
#     end
#     it 'パスワードは、6文字以上での入力が必須であること' do
#       @user.password = '12345'
#         @user.password_confirmation = '12345'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
#     end
#     it 'パスワードは、半角英数字混合での入力が必須であること' do
#       @user.password = 'password'
#       @user.password = 'password'
#         @user.valid?
#         binding.pry
#         expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
#     end
#    end 
#   end
# end 
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


#   bundle exec rspec spec/models/user_spec.rb