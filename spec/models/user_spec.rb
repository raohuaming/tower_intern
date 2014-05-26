require 'spec_helper'

describe User do
  describe 'Verification' do
    subject do
      user = FactoryGirl.create(:user)
      expect(user).to be_valid
      user
    end

    it 'should not allow to have an empty name' do
      subject.name = ""
      expect(subject).not_to be_valid
    end

    it 'should have a password with at least 6 characters' do
      subject.password = '12345'
      expect(subject).not_to be_valid
    end

    it 'should not allow to have an empty email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'should have a valid email address' do
      subject.email = 'test'
      expect(subject).not_to be_valid
      subject.email = 'test@gmail'
      expect(subject).not_to be_valid
    end

    it 'should not allow to duplicate with others' do
      subject.save
      another_user = FactoryGirl.create(:user)
      another_user.email = subject.email
      expect(another_user).not_to be_valid
    end
  end
end
