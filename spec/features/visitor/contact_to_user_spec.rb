require "rails_helper"

feature "Contact user" do
  let(:user) { create(:user) }

  scenario "Visitor contact user successfully" do
    visit user_message_index_path(user)
    fill_form(:message, name: "Phil", email: "phil@yandex.ru", text: Faker::Lorem.sentence(20))
    click_button "Create Message"
    expect(page).to have_content("Message sent.")
  end
end
