require 'rails_helper'

describe SessionsController do

  describe "POST #create" do

    it "returns http success" do
      user = create(:user)
      post(:create, user: { username: user.username, password: user.password } )
      expect(response).to redirect_to(root_path)
    end

    it "sets the (user) session user id" do
      user = create(:user)
      post(:create, user: { username: user.username, password: user.password } )
      expect(user[:id]).to eq(user.id)
    end

    it 'a flash message indicates successful login' do
      user = create(:user)
      post(:create, user: { username: user.username, password: user.password } )
      expect(flash[:success]).to have_content "Success"
    end

  end

  describe "when unsuccessful" do

    it "redirects to login/signup form" do
      user = create(:user)
      post(:create, user: { username: 'domingo', password: '12345678' } )
      expect(response).to redirect_to(sessions_new_path)
    end




  end

end
