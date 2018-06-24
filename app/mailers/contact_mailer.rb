class ContactMailer < ApplicationMailer
  default from: "andrew.webdev09@gmail.com"
  def send_contact_email(email,subject,message)
    @email = email
    @subject = subject
    @message = message


    mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]

# Define your message parameters
    message_params =  { from: "AndrewPDev <#{ENV["MAILGUN_DEFAULT_SMTP"]}>",
                        to: @email,
                        subject: @subject,
                        text: @message
                        }
    # Send your message through the client
    mg_client.send_message ENV["MAILGUN_DOMAIN_URL"],message_params
  end
end
