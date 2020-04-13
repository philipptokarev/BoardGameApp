require "rails_helper"

RSpec.describe UserMailer do
  describe "notify" do
    text = Faker::Lorem.sentence(10)
    let(:mail) { described_class.contact("phil@ya.ru", "Phil", "tok@ya.ru", text) }

    it "renders the headers" do
      expect(mail.subject).to eq("New message from BoardGameApp")
      expect(mail.to).to eq(["phil@ya.ru"])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(text)
    end
  end
end
