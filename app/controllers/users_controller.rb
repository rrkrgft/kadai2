class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
    #user作成のためのインスタンス作成
  end

  def create
    @user = User.new(user_params)
    #()の中にはストロングパラメータを入れる 元々はUser.create(title: params[:user][:neme], email: params[:user][:email]...)
    if @user.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
end
