class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      #投稿一覧画面に遷移 redirect_to
    else
      flash.now[:danger] = 'ログインに失敗しました'
      #nowを書くことで次の一回だけエラーを表示する。
      render :new
    end
  end
end
