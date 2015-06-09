class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_administrator
    @current_administrator ||= Administrator.where(id: session[:administrator_id]).first
  end

  helper_method :current_administrator

  private

  def authenticate_administrator
    unless session[:administrator_id].present? && current_administrator.present?
      flash[:alert] = 'Must be an administrator to access this page'
      redirect_to admin_login_path
    end
  end
end
