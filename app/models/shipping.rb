class Shipping < ApplicationRecord
  belongs_to :buy


  validates :post_code_id,presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id,presence: true, numericality: { other_than: 1 }
  validates :city,presence: true
  validates :house_number,presence: true
  validates :property,
  validates :telephone,presence: true, format: { with: /\A\d{10,11}\z/ }

end
