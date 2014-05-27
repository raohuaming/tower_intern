class UsersController < ApplicationController
  skip_before_filter :require_login, only: [ :new, :create ]

  def new
    @user = User.new
    respond_to do |format|
      format.html { render }
    end
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    respond_to do |format|
      if @user.save
        format.json { render json: { name: @user.name, email: @user.email } }
      else
        format.json { render json: { errors: @user.errors }, status: :unprocessable_entity }
      end
    end
  end
end
