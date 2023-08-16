class Order < ApplicationRecord

  has_many :products, through: :order_products
  
  enum status: {
    pending: 0,
    confirmed: 1
  }
end
