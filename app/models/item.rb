class Item < ApplicationRecord
  validates :item_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_time_id, :price, :image, presence: true

  has_one :buy
  belongs_to :user
  has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
end