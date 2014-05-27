require 'spec_helper'

describe HomeController do
  before do
    @user = FactoryGirl.build(:user)
    @user.password = '12345678'
    expect(@user.save).to be_true
  end

  describe '#index' do
    it 'should response successfully' do
      session[:user_id] = @user.id
      get :index
      expect(response).to be_success
    end
  end

  describe 'Authentication' do
    it 'should require login to access this page' do
      get :index
      expect(response).to redirect_to controller: 'sessions', action: 'new'
    end
  end

end
