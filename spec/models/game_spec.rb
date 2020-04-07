require 'rails_helper'

RSpec.describe Game do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_presence_of :image }

  it { is_expected.to validate_presence_of :description }

  it { is_expected.to have_many :reviews }

  context 'validation test' do
    it 'should successfully save' do
      game = Game.create(name: 'Scythe', description: 'Some description', image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/image.jpg'), 'image/jpeg'))
      expect(game).to be_valid
    end
  end
end
