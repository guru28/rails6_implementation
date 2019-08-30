class RepliesMailbox < ApplicationMailbox
  MATCHER = /postmaster-(.+)@sandbox8f358963ebee4ce3ab929ffb784b6e49.mailgun.org/i

  # reply-1@reply.example.com
  #
  # mail => Mail object
  # inbound_email => ActionMailbox::InboundEmail record

  #before_processing :ensure_subcriber

  def process
    return if subcriber.nil?
    body = mail.parts[0].to_s
    split_array = body.split(" ")
    range_from = split_array.index("7bit") + 1
    range_to = split_array.index("On")
    newsletter.comments.create(
      subcriber_id: subcriber.id,
      body: split_array.slice(range_from...range_to).join(" ")
    )
  end

  def subcriber
    @subcriber ||= Subcriber.find_by(email: mail.from)
  end

  def newsletter
    @newsletter ||= Newsletter.find(newsletter_id)
  end

  def newsletter_id
    recipient = mail.recipients.find{ |r| MATCHER.match?(r) }
    # puts recipient
    # puts "@"*100
    # #recipient[MATCHER, 1]
    recipient.split("@")[0].split("-").last.to_i
  end

  def ensure_subcriber
    if subcriber.nil?
      bounce_with NewsletterMailer.missing(inbound_email)
    end
  end

end
