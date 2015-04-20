require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "requires name, phone number and carrier" do
  	contact = Contact.new
  	assert contact.invalid?
  	assert contact.errors[:name].any?
  	assert contact.errors[:phone_num].any?
  	assert contact.errors[:carrier].any?
  end

  test "requires the phone number to be 10 digits exactly" do
    # Only issue is that my regex will allow of characters are longer than 10 digits.  Researching how to fix that.
  	contact = Contact.new
  	contact.phone_num = 1234
  	assert !contact.save
    assert contact.errors[:phone_num].any?
  end

  # Could have performed the above test this way as well, but wanted to keep it with the configuration of the other tests.
  # test "requires the phone number to be 10 digits exactly" do
  #   contact = Contact.new
  #   contact.phone_num = 1234
  #   assert !contact.save
  #   assert !contact.errors[:phone_num].empty?
  # end

  test "carrier must be a valid carrier" do 
    contact = Contact.new
    contact.carrier = "Not valid"
    assert !contact.save
    assert contact.errors[:carrier].any?
  end

end
