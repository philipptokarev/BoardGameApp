require "rails_helper"

feature "Admin" do

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

  scenario "edit game" do
    login_as(admin)
    visit admin_games_path
    click_link ("Edit")
    fill_form(:game, { name: "Scythe1", description: "Scythe description", image: "Scythe image" })
    click_button "Save"
    expect(page).to have_content("Game updated")
  end

  scenario "delete new game" do
    login_as(admin)
    visit admin_games_path
    click_link ("Delete")
    expect(page).to have_content("Game deleted")
  end
end
