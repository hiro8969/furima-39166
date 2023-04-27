class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #あとでアソシエーション設置

  # validates :nickname, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true
  validates :nickname, presence: true
end
