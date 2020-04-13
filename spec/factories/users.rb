FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "phil#{n}tok@ya.ru" }
    sequence(:full_name) { "Токарев Филипп" }
    sequence(:password) { "12345678" }
    sequence(:password_confirmation) { "12345678" }
  end

  factory :admin, class: User do
    sequence(:email) { |n| "phil#{n}tok@ya.ru" }
    sequence(:full_name) { "Токарев Филипп" }
    sequence(:password) { "12345678" }
    sequence(:password_confirmation) { "12345678" }
    sequence(:role) { "admin" }
  end
end
