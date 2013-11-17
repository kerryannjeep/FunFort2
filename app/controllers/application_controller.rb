class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_child
    @current_child ||= Parent.find(1).children.first
  end
  helper_method :current_child

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_child.nil?
  end
end
