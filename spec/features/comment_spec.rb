require_relative '../rails_helper.rb'

feature "creating a comment" do
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
  let(:comment){attributes_for(:comment)}
  let(:post) { create(:post) }

  scenario "Create a comment" do
    visit post_path(post)
    fill_in 'Content', :with => comment[:content]
    click_button('Add your comment')
    expect(page).to have_content comment[:content]
  end
end
