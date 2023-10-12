class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :price
  end
end
