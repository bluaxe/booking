class UserMailer < ActionMailer::Base
  	default from: "www.axe.so@gmail.com"

  	def welcome_email(user)
  		@user = user
  		mail(to: @user.user_mail, subject: "welcome to demo")
 	end
end
