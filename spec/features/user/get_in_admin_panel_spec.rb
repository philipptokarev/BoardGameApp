require "rails_helper"

feature "Admin panel" do

  let(:user) { create(:user) }

  scenario "User without admin role get in admin panel unsuccessfully" do
    login_as(user)
    visit admin_root_path
    expect(page).to have_content("You do not have access")
  end
end
