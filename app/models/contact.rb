class Contact < ActiveRecord::Base
	validates :name, :phone_num, :carrier, presence: true
	
	# This ensures that there are at least 10 characters in the phone number, but allows more than 10 characters through.
	# Researching this, but wanted to move on to other parts and not get stuck on one thing.
	# Added note, as I was reading through Ruby's Active Record Validations I came across using an if statment and a method 
	#   for validations.  Check out second 5.  I might be able to do a validation if it matches at least 10 digits but not if it matches 11 digits.
	#   http://guides.rubyonrails.org/active_record_validations.html#validation-helpers
	validates_format_of :phone_num, with: /\d{10,10}/, message: "phone number must be 10 digits"
	
	# Would be nice if the error message returned the list of valid carriers.  Will need to include this eventually
	validates :carrier, inclusion: { in: %w(Verizon AT&T Sprint T-Mobile MetroPCS Virgin Boost U.S. Cellular), 
		                             message: "must be a valid carrier." }
end
