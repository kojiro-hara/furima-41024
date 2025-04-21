class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping


  
  validates :price, presence: true
end
