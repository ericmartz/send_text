require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "message must be at least 10 characters" do 
  	# Chose 10 characters to help ensure someone doesn't accidetnally send a text without enough info. 
  	# Don't think there is a right amount of characters to force, but I figure 10 is a good place.
  	message = Message.new
  	message.message_body = "abcde"
  	assert !message.save
    assert message.errors[:message_body].any?
  end
end
