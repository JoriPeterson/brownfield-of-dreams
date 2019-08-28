class ActivateMailer < ApplicationMailer
	def register(current_user)
		@user = current_user
		mail(to: current_user.email, subject: "Activate Your Brownfield Account")
	end

	def invite(email)
		mail(to: email, subject: "Invite to Brownfield")
	end
end
