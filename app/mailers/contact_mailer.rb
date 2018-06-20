class ContactMailer < ApplicationMailer
  default from: "andrew.webdev09@gmail.com"
  def send_contact_email
    @email = email
    @message = message

    mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]

# Define your message parameters
    message_params =  { from: ENV["MAILGUN_DEFAULT_SMTP"],
    to:   @email,
    subject: @message,
    text:    'Sent'
    }
    # Send your message through the client
    mg_client.send_message ENV["MAILGUN_DOMAIN_URL"], message_params
  end
end
