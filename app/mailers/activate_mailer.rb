class ActivateMailer < ApplicationMailer
	def register(current_user)
		@user = current_user
		mail(to: current_user.email, subject: "Activate Your Brownfield Account")
	end

	def invite(user, handle)
		@user = user
		@inviter_handle = handle
		mail(to: user[:email], subject: "Invite to Brownfield")
	end
end
