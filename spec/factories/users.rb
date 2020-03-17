FactoryBot.define do
  factory :user, class: User  do
    email { "philtok@ya.ru" }
    full_name { "Токарев Филипп" }
    password { "12345678" }
    password_confirmation { password }
  end

  factory :admin, class: User do
    email { "philtok@ya.ru" }
    full_name { "Токарев Филипп" }
    password { "12345678" }
    password_confirmation { password }
    role { "admin" }
  end
end
