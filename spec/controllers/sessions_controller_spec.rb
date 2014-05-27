require 'spec_helper'

describe SessionsController do
  before do
    @user = FactoryGirl.build(:user)
    @user.password = '1234567890'
    expect(@user.save).to be_true
  end

  describe '#new' do
    it 'should response successfully' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'should authenticate user with his email and password' do
      post_data = {
        email: @user.email,
        password: @user.password,
        format: :json
      }
      post :create, post_data
      expect(session[:user_id]).to eq(@user.id)
      expect(JSON.parse(response.body)["user"]["name"]).to eq(@user.name)
    end

    it 'should return forbidden status and error messages' do
      post_data = {
        email: @user.email,
        password: 'wrongpassword',
        format: :json
      }
      post :create, post_data
      expect(session[:user_id]).to eq(nil)
      expect(response.body.to_json).to include('密码错误')
      expect(response.status).to eq(403)
    end
  end

end
