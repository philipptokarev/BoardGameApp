require "rails_helper"

feature "Visitor sign up" do

  let!(:registered_user) { create(:user) }

  scenario "Successfully" do
    visit root_path
    click_link "Sign up"
    fill_in "user[email]", with: "tokphil@mail.ru"
    fill_in "user[password_confirmation]", with: "qwerty"
    fill_in "user[password]", with: "qwerty"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "Not successfully" do
    visit root_path
    click_link "Sign up"
    fill_in "user[email]", with: "philtok@ya.ru"
    fill_in "user[password_confirmation]", with: "qwerty"
    fill_in "user[password]", with: "qwerty"
    click_button "Sign up"
    expect(page).to have_content("User could not be created")
  end
end
