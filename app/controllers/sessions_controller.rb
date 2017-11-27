class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
      		if user.activated?
        		log_in user
        		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        		redirect_back_or user
      		else
        		message  = "アカウントが有効になっていません。"
        		message += "電子メールでアクティベーションリンクを確認してください。"
        		message += " #{view_context.link_to "有効化メールを再送信", { action: "resend_activation", controller: "account_activations", email: user.email }, method: :post}"
        		flash[:warning] = message
        		redirect_to root_url
      		end
		else
			@error = "無効なメールアドレスまたはパスワード"
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end