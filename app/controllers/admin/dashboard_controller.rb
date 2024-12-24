class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @happies = Happy.all
    @unhappies = Unhappy.all
  end

  private

  def require_admin
    unless session[:admin_id]
      redirect_to admin_login_path, alert: "管理者権限が必要です。"
    end
  end
end
