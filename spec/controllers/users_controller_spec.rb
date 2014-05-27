require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.build(:user)
    expect(@user).to be_valid
  end

  describe '#new' do
    it 'should response success' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    subject(:data) do
      {
        name: @user.name,
        email: @user.email,
        password: @user.password,
        format: :json
      }
    end

    context 'provide correct information' do
      it 'should return the created user as json' do
        expect{ post :create, data }.to change { User.count }.by 1
      end
    end

    context 'provide incorrect information' do
      it 'should return error messages' do
        @user.password = '12345'
        expect{ post :create, data }.not_to change { User.count }.by 1
        expect(response.body.to_json).to include("password")
      end
    end

  end

end
