require "rails_helper"

feature "User" do
  let(:user) { create(:user) }
  let(:game) { create(:game) }

  describe "Review for a game" do
    scenario "Leave successfully" do
      login_as(user)
      visit game_path(game)
      click_link "add review"
      fill_in "Review", with: Faker::Lorem.sentence(2)
      click_button "Leave"
      expect(page).to have_content("Review created")
    end

    scenario "Edit successfully" do
      login_as(user)
      visit game_path(game)
      click_link "add review"
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
      click_link "add review"
      find("div#rating-form")
      fill_in "Review", with: Faker::Lorem.sentence(2)
      click_button "Leave"
      click_link "Delete"
      expect(page).to have_content("Review deleted")
    end
  end
end
