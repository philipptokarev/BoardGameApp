require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_presence_of :image }

  it { is_expected.to validate_presence_of :description }

  it { is_expected.to have_many :reviews }

  context 'validation test' do
    it 'should successfully save' do
      game = Game.create(name: 'Scythe', description: 'Some description', image: 'image').save
      expect(game).to be_truthy
    end
  end
end
