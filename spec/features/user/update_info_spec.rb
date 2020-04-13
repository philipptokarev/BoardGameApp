require "rails_helper"

feature "Update Account" do
  let(:user) { create(:user) }

  scenario "User updates account with valid data" do
    login_as(user)
    visit edit_user_registration_path
    fill_form(:user, full_name: "New Name")
    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully")
  end

  scenario "User enters not matched passwords" do
    login_as(user)
    visit edit_user_registration_path
    fill_in "user[password_confirmation]", with: "123456"
    fill_in "user[password]", with: "qwerty"
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
