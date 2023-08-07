class Product < ApplicationRecord
  
  has_one_attached :image
  
  enum category: {
    NO_CATEGORY: 0,
    ENTREE: 1,
    SECOND_COURSE: 2,
    DESSERT: 3
  }




end
