class SendMessage < ActionMailer::Base
  default from: "notifications@bankofgeorgia.com"

  def prep_sender(message)
  	@message = message
  	@contacts = Contact.all
  	@contacts.each do |contact|
  		if contact.carrier == "Verizon"
  			email = contact.phone_num.to_s + "@vtext.com"
  			subject = "Verizon Found"
  		elsif contact.carrier == "AT&T"
  			email = contact.phone_num.to_s + "@txt.att.net"
  			subject = "AT&T Found"
  		end	
  		SendMessage.send_message(@message, subject, email).deliver
  	end
  end

  def send_message(message, subject, contact)
  	@message = message
  	@subject = subject
  	@contact = contact
  	mail(to: @contact, subject: @subject, message: @message.message_body)
  end
end
