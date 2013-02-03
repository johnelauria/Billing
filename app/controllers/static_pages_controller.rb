class StaticPagesController < ApplicationController

  before_filter :sign_in_first, only: [ :store ]
  def store
  	@products = Product.all
  	@line_item = LineItem.new(params[:line_item])
    @account = Account.find(current_user.id)
  	
  	if current_user.carts.last.nil?
  		Cart.create(account_id: current_user.id, status: "unpaid")
  	else
  		if current_user.carts.last.status == "success"
  			Cart.create(account_id: current_user.id, status: "unpaid")
  		end
  	end
  end

  def credit_payment
    if current_user.credits >= current_user.carts.last.line_items.to_a.sum(&:total)
      current_user.credits = current_user.credits - current_user.carts.last.line_items.to_a.sum(&:total)
      flash[:success] = "Transaction successful."
      current_user.save
      current_user.carts.last.update_attributes(status: "success", time_purchased: Time.now, date_purchased: Date.today, payment_method: "Customer's Credits")
      redirect_to root_path
    else
      flash[:error] = "Transaction failed! You currently have insufficient balance. Please reload your credits or use our 2checkout system to pay online via credit card"
      redirect_to static_pages_store_path
    end
  end
end
