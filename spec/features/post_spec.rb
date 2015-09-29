require_relative '../rails_helper'

feature "creating a post" do
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



  let(:post){attributes_for(:post)}

  scenario "Create a post" do
    click_link('Create a new Post')
    fill_in 'Title', :with => post[:title]
    fill_in 'Url', :with => post[:url]
    click_button('Post your Post')
    expect(page).to have_content post[:title]
  end

end
