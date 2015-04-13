class SendMessage < ActionMailer::Base
  default from: "notifications@bankofgeorgia.com"

  def prep_sender(message)
  	contacts = Contact.all
  	contacts.each do |contact|
  		if contact.carrier == "Verizon"
  			email = contact.phone_num.to_s + "@vtext.com"
  		elsif contact.carrier == "AT&T"
  			email = contact.phone_num.to_s + "@txt.att.net"
  		elsif contact.carrier == "T-Mobile"
  			email = contact.phone_num.to_s + "@tmomail.net"
  		end	
  		SendMessage.send_message(message, "Notification from The Bank of Georgia", email).deliver
  	end
  end

  def send_message(message, subject, contact)
  	@message = message
  	mail(to: contact, subject: subject, message: @message.message_body)
  end
end
