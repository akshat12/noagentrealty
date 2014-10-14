class UserMailer < ActionMailer::Base
  default from: "caffeine.zombies@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reg_confirmation.subject
  #
  def reg_confirmation(user)
   @user = user
   mail(:to => user.email, :subject => "DecoHub - Account Registration Confirmation")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail(:to => user.email, :subject => "DecoHub - Password Reset Instructions")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_user.subject
  #
  def contact_user(user, message)
    @user = user
    @message = message
    mail(:to => user.email, :reply_to => message.email, :subject => "DecoHub - New Message Notification")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_user.subject
  #
  def notify_flag(user, flag, flaggable)
    @user = user
    @flag = flag
    @flaggable = flaggable
    mail(:to => user.email, :subject => "DecoHub - Flag Notification")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_user.subject
  #
  def contact_us(message)
    @message = message
    email_with_name = "#{@message.name} <#{@message.email}>"
    mail(:to => "caffeine.zombies@gmail.com", :reply_to => email_with_name, :subject => "DecoHub - Contact Us Notification")
  end
end
