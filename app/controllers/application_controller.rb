class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  
  protect_from_forgery with: :exception
  
  private
  def only_if_logged_in
    unless logged_in?
      flash[:danger] = 'Please log in first'
      redirect_to login_url
    end
  end
end
