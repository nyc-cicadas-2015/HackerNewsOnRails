require 'rails_helper'
require 'factory_girl_rails'

describe SessionsController do
  describe "POST #create" do
    before(:each){
      user = create(:user)
      post :create, session: { username: user[:username], password: user[:password] }
    }

    let(:user){attributes_for(:user) }

    it "returns http success" do
      expect(response).to redirect_to(root_path)
    end



  end
end
