class TrashesController < ApplicationController
  def index
    @trashes = Trash.all.order(updated_at: "DESC")
  end

  def show
    @trash = Trash.find(params[:id])
  end

  def new
    @trash = Trash.new
  end

  def create
    @trash = Trash.new(trash_params)
    @trash.user_id = current_user.id
    if @trash.save
      redirect_to trashes_path, notice: "投稿しました！"
    else
      render :new
    end
  end
  
  def edit
    @trash = Trash.find(params[:id])
    if @trash.user != current_user
      redirect_to trashes_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @trash = Trash.find(params[:id])
    if @trash.update(trash_params)
      redirect_to trashes_path, notice: "ゴミ情報を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @trash = Trash.find(params[:id])
    @trash.destroy
    redirect_to trashes_path, notice: "ゴミ情報を削除しました。"
  end
  
  private
  def trash_params
    params.require(:trash).permit(:title, :prefecture, :trash_image, :trash_profile, :city)
  end
end
