require "rails_helper"

feature "Visitor browse game catalog" do
  let!(:games) { 10.times { create(:game) } }

  scenario "Successfully" do
    visit root_path
    click_link "game catalog"
    click_link "Next"
    expect(page).to have_content("BoardGameName")
  end
end
