require 'rails_helper'

describe SessionsController do

  describe "POST #create" do

    it "returns http success" do
      user = create(:user)
      post(:create, user: { username: user.username, password: user.password } )
      expect(response).to redirect_to(root_path)
    end

    it "sets the session user id" do
      user = create(:user)
      post(:create, user: { username: user.username, password: user.password } )
      expect(user[:id]).to eq(user.id)
    end



  end
end
