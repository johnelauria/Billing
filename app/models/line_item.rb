class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity, :unit_price

  belongs_to :cart
  belongs_to :product

  before_save :ensure_quantity_more_than_one

  def ensure_quantity_more_than_one
    if self.quantity.nil?
      self.quantity = 1
    else
  	 if self.quantity <= 1
  		  self.quantity = 1
  	 end
    end
  end
end
