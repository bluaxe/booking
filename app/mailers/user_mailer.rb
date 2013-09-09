class UserMailer < ActionMailer::Base
  	default from: "Demo <www.axe.so@gmail.com>"

  	def welcome_email(user)
  		@user = user
		@url=url_for(host: '192.168.152.137',
						controller: 'user',
						action: 'verify',
						code: @user.verified
					) 
  		mail(to: @user.user_mail, subject: "welcome to demo")
 	end
end
