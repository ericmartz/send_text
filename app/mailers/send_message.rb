class SendMessage < ActionMailer::Base
  default from: "notifications@bankofgeorgia.com"

  def send_message
  	mail(to: , subject:)
  end
end
