require_relative '../rails_helper'

feature "the signin process" do
  background :each do
    create(:user)
    log_me_in
  end

  let(:log_me_in) {
    visit sessions_new_path
    within("#session") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
    end

    click_button 'Sign in'
  }

  let(:user){attributes_for(:user)}

  scenario "Login with correct credentials" do
    expect(page).to have_content 'Success'
  end

  scenario "Logout" do
    click_link('Logout')
    expect(page).to have_content 'You are successfully logged out'
  end


end
