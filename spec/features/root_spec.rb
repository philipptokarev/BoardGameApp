require "rails_helper"

feature "Guest and user" do

  let(:user) { create(:user) }
  let(:game) { create(:game) }

  feature "Sign Up" do

    let!(:user) { create(:user) }

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

  describe 'Sign In' do
    scenario "Successfully" do
      visit root_path
      click_link "Sign in"
      fill_form(:user, { email: user.email, password: user.password })
      click_button "Sign in"
      expect(page).to have_content("Signed in successfully.")
    end

    scenario "Not successfully" do
      visit root_path
      click_link "Sign in"
      fill_form(:user, { email: user.email, password: user.password + "12321" })
      click_button "Sign in"
      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "Not successfully" do
      visit root_path
      click_link "Sign in"
      fill_form(:user, { email: user.email + "1", password: user.password })
      click_button "Sign in"
      expect(page).to have_content("Invalid Email or password.")
    end
  end

  scenario "not get in admin panel" do
    login_as(user)
    visit admin_root_path
    expect(page).to have_content("You do not have access")
  end

  describe "Review for a game" do

    let!(:user) { create(:user) }

    scenario "Leave successfully" do
      login_as(user)
      visit game_path(game)
      click_link "Add review"
      fill_in "Review", with: Faker::Lorem.sentence(2)
      click_button "Leave"
      expect(page).to have_content("Review created")
    end

    scenario "Edit successfully" do
      login_as(user)
      visit game_path(game)
      click_link "Add review"
      fill_in "Review", with: Faker::Lorem.sentence(2)
      click_button "Leave"
      click_link "Edit"
      fill_in "Review", with: Faker::Lorem.sentence(2)
      click_button "Update"
      expect(page).to have_content("Review updated")
    end

    scenario "Delete successfully" do
      login_as(user)
      visit game_path(game)
      click_link "Add review"
      find("div#rating-form")
      fill_in "Review", with: Faker::Lorem.sentence(2)
      click_button "Leave"
      click_link "Delete"
      expect(page).to have_content("Review deleted")
    end
  end
end

describe "Admin" do
  let(:admin) { create(:admin) }
  let!(:game) { create(:game) }

  scenario "get in admin panel" do
    login_as(admin)
    visit admin_root_path
    expect(page).to have_content("admin panel")
  end

  scenario "create new game" do
    login_as(admin)
    visit admin_root_path
    click_link "Add new game"
    fill_form(:game, { name: "Scythe", description: "Scythe description", image: "Scythe image" })
    click_button "Create"
    expect(page).to have_content("Game added")
  end

  scenario "get game catalog" do
    login_as(admin)
    visit admin_games_path
    expect(page).to have_content('BoardGameName')
  end
end
