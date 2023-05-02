class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys
  
  validates :nickname, :family_name_kana, :first_name_kana, :birth_day, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみで入力して下さい' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみで入力して下さい' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end 
end
