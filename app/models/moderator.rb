class Moderator < ApplicationRecord
	has_many :posts
	has_secure_password #this said when you have a model check if you have a secure password

end
