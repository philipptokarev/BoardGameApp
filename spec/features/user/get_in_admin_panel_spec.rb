require "rails_helper"

feature "User get in admin panel" do

  let(:user) { create(:user) }

  scenario "Unsuccessfully" do
    login_as(user)
    visit admin_root_path
    expect(page).to have_content("You do not have access")
  end
end
