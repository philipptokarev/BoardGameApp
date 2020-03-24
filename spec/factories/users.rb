FactoryBot.define do
  factory :user, class: User  do
    sequence(:email) { |n| "phil#{n}tok@ya.ru" }
    sequence(:full_name) { |n| "Токарев Филипп" }
    sequence(:password) { |n| "12345678" }
    sequence(:password_confirmation) { |n| "12345678" }
  end

  factory :admin, class: User do
    sequence(:email) { |n| "phil#{n}tok@ya.ru" }
    sequence(:full_name) { |n| "Токарев Филипп" }
    sequence(:password) { |n| "12345678" }
    sequence(:password_confirmation) { |n| "12345678" }
    sequence(:role) { |n| "admin" }
  end
end
