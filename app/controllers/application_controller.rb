class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login
  attr_accessor :current_user

  rescue_from User::Unauthentication do |exception|
    respond_to do |format|
      format.html { redirect_to new_session_path }
      format.json { render json: { errors: { message: '你需要登录系统才能进行下一步操作' } }, status: :forbidden }
    end
  end

  protected
  def require_login
    if session[:user_id]
      user = User.find(session[:user_id])
      if user
        self.current_user = user
      else
        raise User::Unauthentication
      end
    else
      raise User::Unauthentication
    end
  end

end
