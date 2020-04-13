require "rails_helper"

feature "Get users list" do
  let!(:users) { 10.times { create(:user) } }

  scenario "Visitor contact user successfully" do
    visit users_path
    click_link("Next")
    expect(page).to have_content("Токарев Филипп")
  end
end
