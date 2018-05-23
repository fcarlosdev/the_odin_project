class UserMailer < ApplicationMailer

  default from: 'noreply@odinbook.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Odinbook')
  end

end
