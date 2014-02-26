class AppMailer < ActionMailer::Base
  default from: "friendly-email-robot@railsgirlsathens.com"

  def app_submitted(user)
    @user = user
    mail(to: @user.email, subject: 'Rails Girls Athens - Application Received!')
  end
end
