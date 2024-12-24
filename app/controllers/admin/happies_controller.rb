class Admin::HappiesController < ApplicationController
  before_action :require_admin
  before_action :set_happy, only: [:edit, :update, :destroy]

  def index
    @happies = Happy.all
  end

  def new
    @happy = Happy.new
  end

  def create
    @happy = Happy.new(happy_params)
    if @happy.save
      redirect_to admin_dashboard_path, notice: "Happy Word が作成されました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @happy.update(happy_params)
      redirect_to admin_dashboard_path, notice: "Happy Word が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @happy = Happy.find(params[:id])
    if @happy.destroy
      redirect_to admin_dashboard_path, notice: "Happy Word が削除されました"
    end
  end

  private

  def set_happy
    @happy = Happy.find(params[:id])
  end

  def happy_params
    params.require(:happy).permit(:text)
  end

  def require_admin
    unless admin_logged_in?
      redirect_to request.referrer || admin_login_path, alert: "管理者権限が必要です"
    end
  end
end
