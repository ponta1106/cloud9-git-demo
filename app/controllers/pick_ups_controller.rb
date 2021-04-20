class PickUpsController < ApplicationController
  def index
    @pick_ups = PickUp.all.order(updated_at: "DESC")
  end

  def show
    @pick_up = PickUp.find(params[:id])
  end

  def new
    @pick_up = PickUp.new
  end

  def create
    @pick_up = PickUp.new(pick_up_params)
    @pick_up.user_id = current_user.id
    if @pick_up.save
      redirect_to pick_ups_path, notice: "投稿しました！"
    else
      render :new
    end
  end
  
  def edit
    @pick_up = PickUp.find(params[:id])
    if @pick_up.user != current_user
      redirect_to pick_ups_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @pick_up = PickUp.find(params[:id])
    if @pick_up.update(pick_up_params)
      redirect_to pick_ups_path, notice: "ゴミ情報を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @pick_up = Pick_p.find(params[:id])
    @pick_up.destroy
    redirect_to pick_ups_path, notice: "ゴミ情報を削除しました。"
  end
  
  private
  def pick_up_params
    params.require(:pick_up).permit(:title, :prefecture, :pick_up_image, :pick_up_profile, :city)
  end
end
