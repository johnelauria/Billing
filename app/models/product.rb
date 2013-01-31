class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :product_type
end
