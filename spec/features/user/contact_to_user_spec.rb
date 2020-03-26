require "rails_helper"

feature "Userr contact with another user" do

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }

  scenario "Successfully" do
    login_as(user)
    visit contact_path(another_user)
    fill_form(:message, { text: Faker::Lorem.sentence(20) })
    click_button "Create Message"
    expect(page).to have_content("Message sent.")
  end
end
