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

	def prevent_customer
		unless current_user.account_type == "Admin"
			flash[:error] = "You are restricted to access that page."
			redirect_to root_path
		end
	end

	def prevent_everyone
		flash[:error] = "The page you have requested is exclusively used by the system. It contains sensitive information. Modifying anything from that page may result to having incorrect transaction details. To protect these sensitive data, it is best to restrict this page from everyone except from the system"
		redirect_to root_path
	end

	def sign_in_first
		unless signed_in?
			flash[:error] = "Sign in first!"
			redirect_to root_path
		end
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
		flash[:warning] = "You have successfully signed out"
	end
end
