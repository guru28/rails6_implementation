class NewsletterMailer < ApplicationMailer

	def newsletter_email(user, newsletter)
    @user = user
    @newsletter = newsletter
    mail(from: @newsletter.from_address ,to: user.email, subject: @newsletter.subject, reply_to: "postmaster-#{@newsletter.id}@sandbox8f358963ebee4ce3ab929ffb784b6e49.mailgun.org")
  end

end
