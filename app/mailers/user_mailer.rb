class UserMailer < ApplicationMailer
  def contact(user_email, name, email, text)
    @name = name
    @email = email
    @text = text
    mail to: user_email, subject: "New message from BoardGameApp"
  end
end
