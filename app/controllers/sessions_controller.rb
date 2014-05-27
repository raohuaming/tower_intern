class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [ :new, :create ]

  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    session[:user_id] = nil
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.json do
          render json: { user: { name: @user.name, email: @user.email } }
        end
      else
        format.json do
          render json: { errors: { message: '密码错误' } }, status: :forbidden
        end
      end
    end

  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to new_session_path }
    end

  end
end
