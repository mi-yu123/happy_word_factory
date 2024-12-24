class ApplicationController < ActionController::Base
  helper_method :admin_logged_in?

  def admin_logged_in?
    session[:admin_id].present? && Admin.find_by(id: session[:admin_id]).present?
  end

  def require_admin
    unless admin_logged_in?
      redirect_to root_path, alert: "管理者権限が必要です"
    end
  end

  def login_admin(admin)
    session[:admin_id] = admin_id
  end

  def logout_admin
    session.delete[:admin_id]
  end
end
