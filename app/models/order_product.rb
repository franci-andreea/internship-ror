class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validate_numericality_of :quantity, greater_than_or_equal_to: 1
end
