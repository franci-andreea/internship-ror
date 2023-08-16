class Product < ApplicationRecord
  
  has_many :orders, through: :order_products

  has_one_attached :image
  
  enum category: {
    no_category: 0,
    entree: 1,
    second_course: 2,
    dessert: 3
  }

end
