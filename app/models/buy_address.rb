class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address, :building_name, :phone_number, :buy_id, :item_id, :user_id

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    buy = Buy.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number,buy_id: buy.id)
  end
end
