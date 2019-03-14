class NotificationsController < ApplicationController
  def new
    @notice = Notification.new
  end

  def create
    @notice = Notification.new(notice_params)
    if @notice.save
      redirect_to notifications_path,success: "お知らせを投稿しました"
    else
      render :new
    end
  end

  def index
    @notices = Notification.all
  end

  def show
  end

  def edit
    @notice = Notification.find(params[:id])
  end


  def destroy
    Notification.find(params[:id]).destroy
    flash[:success] = "お知らせを削除しました"
    redirect_to notifications_url
  end

  def update
    @notice = Notification.find(params[:id])
    if @notice.update_attributes(notice_params)
    flash[:success] = "更新が完了しました"
    redirect_to notifications_url
    else
      render 'edit'
    end
  end


  private
  def notice_params
    params.require(:notification).permit(:title,:text,:category,:eyecatch)
  end
end
