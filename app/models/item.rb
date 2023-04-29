class Item < ApplicationRecord
  validates :item_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_time_id, :price, :image, presence: true

  has_one :buy
  belongs_to :user
  has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank"} 

end