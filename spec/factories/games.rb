FactoryBot.define do
  factory :game do
    sequence(:name) { |n| "BoardGameName#{n}" }
    sequence(:description) { |n| "Some description#{n}" }
    sequence(:image) { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/image.jpg'), 'image/jpeg') }
    sequence(:status) { |n| :published }
  end
end
