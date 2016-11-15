class UserMailer < ApplicationMailer
  default from: 'blocacres@gmail.com'

  def appointment_email(user)
    @user = user
    @url = 'http://moverable.com/login'
    mail(to: @user.email, subject: 'You have an appointment')
  end
end
