class StaticPagesController < ApplicationController
  def store
  	@products = Product.all
  	@line_item = LineItem.new(params[:line_item])
  	
  	if current_user.carts.last.nil?
  		Cart.create(account_id: current_user.id)
  	else
  		if current_user.carts.last.status == "success"
  			Cart.create(account_id: current_user.id, status: "unpaid")
  		end
  	end
  end
end
