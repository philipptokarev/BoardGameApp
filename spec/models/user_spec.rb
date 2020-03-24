require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensure name presence and truthly password' do
      user = User.create(full_name: 'John', password: '123456').save
      expect(user).to be_falsy
    end

    it 'ensure surname presence and truthly password' do
      user = User.create(full_name: 'Johnson', password: '123456').save
      expect(user).to be_falsy
    end

    it 'will successfully save' do
      user = User.create(email: 'tok@ya.ru', password: '123456').save
      expect(user).to be_truthy
    end

    it 'ensure name presence and wrong password' do
      user = User.create(full_name: 'John', password: '12345').save
      expect(user).to be_falsy
    end

    it 'ensure surname presence and wrong password' do
      user = User.create(full_name: 'Johnson', password: '12345').save
      expect(user).to be_falsy
    end

    it 'ensure login presence and wrong password' do
      user = User.create(email: 'tok@ya.ru', password: '12345').save
      expect(user).to be_falsy
    end
  end
end
