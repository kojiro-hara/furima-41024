class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days


  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"  }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank"  }
  validates :burden_id, numericality: { other_than: 1, message: "can't be blank"  }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"  }
  validates :days_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
