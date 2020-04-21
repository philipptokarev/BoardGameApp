require "rails_helper"

RSpec.describe ContactUser do
  it "Contact user successfully" do
    interactor = described_class.call(params: { name: "phil", email: "phil@yandex.ru", text: Faker::Lorem.sentence(5) })
    expect(interactor).to be_a_failure
  end

  it "Contact user unsuccessfully" do
    interactor = described_class.call(params: { name: "phil" })
    expect(interactor).to be_a_failure
  end
end
