class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# ユーザーをサインインさせ、ユーザーページ(show)にリダイレクト
			sign_in user
			redirect_to user
		else
			# エラーメッセージを表示し、サインインフォームを再描画する
			flash.now[:error] = 'Invalid email/ password conbination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
