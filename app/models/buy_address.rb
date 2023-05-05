class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :buy_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :address, :phone_number, :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :phone_number, length: { minimum: 10, maximum: 11 }
  validates :phone_number, format: { with: /\A[0-9]+\z/ }


  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
