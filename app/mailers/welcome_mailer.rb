class WelcomeMailer < ActionMailer::Base
  default from: "welcome@rowingdiary.com"

  	def welcome_email(user)
		@user = user
		mail(:to => user.email, :subject => "Welcome to Rowing Diary!")
end

end
