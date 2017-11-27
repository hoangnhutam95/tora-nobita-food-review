class AccountActivationsController < ApplicationController
  	def edit
    	user = User.find_by(email: params[:email])
    	if user && !user.activated? && user.authenticated?(:activation, params[:id])
    		user.activate
      		log_in user
      		flash[:success] = "アカウント が アクティブされた"
      		redirect_to user
    	else
      		flash[:danger] = "不正アクティブリンク"
      		redirect_to root_url
    	end
  	end
    
    def resend_activation
      user = User.find_by(email: params[:email])
      if user
        user.resend_activation_email
        flash[:info] = "メールを確認してアカウントを有効にしてください。"
        redirect_to root_url
      else
        flash[:danger] = "あなたの電子メールアドレスのアカウントが見つかりませんでした。"
        redirect_to root_url
      end
    end
end
