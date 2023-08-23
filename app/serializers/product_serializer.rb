class ProductSerializer < ApplicationSerializer
  attributes :id, :name, :price, :vegetarian, :category, :description
end
