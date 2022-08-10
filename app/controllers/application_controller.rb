class ApplicationController < ActionController::Base
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end
