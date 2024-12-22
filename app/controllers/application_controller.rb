class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  helper_method :admin_logged_in?

  def admin_logged_in?
    session[:admin_id].present? && Admin.find_by(id: session[:admin_id]).present?
  end

  def require_admin
    redirect_to root_path, alert: '管理者権限が必要です' unless admin_logged_in?
  end
end
