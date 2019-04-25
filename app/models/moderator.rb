class Moderator < ApplicationRecord
	has_many :posts
	has_secure_password #this said when you have a model check if you have a secure password
	validates :fullname, presence: true
	validates :username, presence: true, confirmation: { case_sensitive: true }, format: { with: /@/, message: "is not valid"}
	validates :password, presence: true, length: { minimum: 8, message: "at least 8 characters"}
end
