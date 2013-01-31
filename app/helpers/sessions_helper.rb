module SessionsHelper
	def sign_in(account)
		cookies.permanent[:remember_token] = account.remember_token
		self.current_user = account
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(account)
		@current_user = current_user
	end

	def current_user
		@current_user ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def admin?
		current_user.account_type == "Admin"
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
		flash[:warning] = "You have successfully signed out"
	end
end
