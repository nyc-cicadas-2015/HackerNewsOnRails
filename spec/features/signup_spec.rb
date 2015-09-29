require_relative '../rails_helper'

feature "the signup process" do
  background :each do
      create(:user)
      puts user
  end

  let(:user){attributes_for(:user)}

  scenario "signing up" do
    visit sessions_new_path
    within("#new_user") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
      fill_in 'Confirm', :with => user[:confirm]
    end

    click_link('Signup')

  end

end


