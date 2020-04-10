require "rails_helper"

feature "Change email" do

  let(:user) { create(:user) }

  scenario "User change email" do
    login_as(user)
    visit edit_user_registration_path(user)
    fill_in "user[password]", with: "12345678"
    fill_in "user[password_confirmation]", with: "12345678"

    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
