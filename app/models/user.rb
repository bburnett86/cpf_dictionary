require 'bcrypt'

class User < ApplicationRecord
	include BCrypt

	has_secure_password

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, length: {minimum: 8}

	def self.authenticate(username, password)
		if user = User.find_by(username: username)
			if user.authenticate(password)
				return user
			end
		end
	end

	# TEST TEST
	
end
