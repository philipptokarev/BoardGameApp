# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact
    UserMailer.contact("phil@ya.ru","Phil","tok@ya.ru",Faker::Lorem.sentence(100))
  end
end
