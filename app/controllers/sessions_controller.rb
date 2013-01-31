class SessionsController < ApplicationController
  def create
  	account = Account.find_by_username(params[:session][:username])
  	if account && account.authenticate(params[:session][:password])
  		sign_in account
  		flash[:info] = "Successfully Signed in!"
  		redirect_to current_user
  	else
  		flash[:error] = "Incorrect Username or password"
  		redirect_to root_path
  	end
  end

  def new
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
