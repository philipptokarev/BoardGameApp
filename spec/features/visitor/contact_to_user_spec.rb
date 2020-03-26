require "rails_helper"

feature "Visitor contact with another user" do

  let!(:user) { create(:user) }

  scenario "Successfully" do
    visit contact_path(user)
    fill_form(:message, { name: "Phil", email: "phil@yandex.ru", text: Faker::Lorem.sentence(20) })
    click_button "Create Message"
    expect(page).to have_content("Message sent.")
  end
end
