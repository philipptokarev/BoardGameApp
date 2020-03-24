require "rails_helper"

feature "User" do

  let(:user) { create(:user) }

  describe "Sign In" do

    scenario "Successfully" do
      visit root_path
      click_link "Sign in"
      fill_form(:user, { email: user.email, password: user.password })
      click_button "Sign in"
      expect(page).to have_content("Signed in successfully.")
    end

    scenario "Unsuccessfully" do
      visit root_path
      click_link "Sign in"
      fill_form(:user, { email: user.email, password: user.password + "12321" })
      click_button "Sign in"
      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "Unsuccessfully" do
      visit root_path
      click_link "Sign in"
      fill_form(:user, { email: user.email + "1", password: user.password })
      click_button "Sign in"
      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
