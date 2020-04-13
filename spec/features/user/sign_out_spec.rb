require "rails_helper"

feature "User sign out" do
  let(:user) { create(:user) }

  scenario "Successfully" do
    login_as(user)
    visit root_path
    click_link "Sign out"
    expect(page).to have_content("Sign in")
  end
end
