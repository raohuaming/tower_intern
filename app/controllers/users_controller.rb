class UsersController < ApplicationController
  def new
    @user = User.new
    respond_to do |format|
      format.html { render }
    end
  end
end
