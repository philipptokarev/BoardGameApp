require "rails_helper"

feature "Visitor browse game catalog" do

  let!(:game) { create(:game) }

  scenario "Successfully" do
    visit root_path
    click_link "game catalog"
    expect(page).to have_content("Game")
  end
end
