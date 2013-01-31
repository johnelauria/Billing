class StaticPagesController < ApplicationController
  def store
  	@products = Product.all
  	@line_item = LineItem.new(params[:line_item])
  	
  	if current_user.carts.last.nil?
  		Cart.create(account_id: current_user.id)
  	end
  end
end
