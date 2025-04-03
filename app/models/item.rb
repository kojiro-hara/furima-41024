class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :product_name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
