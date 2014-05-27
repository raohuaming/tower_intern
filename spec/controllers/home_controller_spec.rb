require 'spec_helper'

describe HomeController do

  describe '#index' do
    it 'should response successfully' do
      get 'index'
      expect(response).to be_success
    end
  end

end
