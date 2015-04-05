class SendMessage < ActionMailer::Base
  default from: "notifications@bankofgeorgia.com"

  def send_message(message)
  	@message = message
  	mail(to: "6788590929@vtext.com", subject: "Notification from The Bank of Georgia", message: @message.message_body)
  end
end
