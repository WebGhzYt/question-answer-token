class Sender < ActiveRecord::Base		
	# has_many :question
	belongs_to :question
	before_create :generate_token

	protected

	def generate_token
		self.token = loop do
		    random_token = SecureRandom.urlsafe_base64(nil, false)
	  		break random_token unless Sender.exists?(token: random_token)
		end
	end
	
end
