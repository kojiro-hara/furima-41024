class BuyShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code_id, :prefecture_id, :city, :house_number, :property, :telephone, :token

  with_options presence: true do
    validates :token
    validates :post_code_id, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :house_number
    validates :telephone, format: { with: /\A\d{10,11}\z/,message:"Input only number"},
                          length: { minimum: 10, too_short: "is too short" }
    validates :user_id
    validates :item_id
  end
  
  validates :prefecture_id, numericality: {other_than: 0,message: "can't be blank"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code_id: post_code_id, prefecture_id: prefecture_id, city: city, house_number: house_number, property: property, telephone: telephone, buy_id: buy.id)
  end
end
