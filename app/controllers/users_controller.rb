class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to users_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end
    
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to trashes_path, notice: "ユーザーを削除しました。"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :prefecture, :city, :profile, :image)
  end
  
end