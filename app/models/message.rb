class Message < ActiveRecord::Base
	validates :message_body, presence: true, length: { minimum: 10 }
end
