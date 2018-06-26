class ContactController < ApplicationController
  def index
  end

  def mail
    if params[:contact]
    email = params[:contact][:email]
    subject = params[:contact][:subject]
    message = params[:contact][:message]

      if email.present? || message.present?
      # Tell the UserMailer to send a welcome email after save
      ContactMailer.send_contact_email(email,subject,message).deliver_now
      redirect_to '/contact/sent'
      else
        flash[:warning] = "Please fill out the form"
        redirect_to '/contact'
      end
    end
  end

  def sent
  end
end
