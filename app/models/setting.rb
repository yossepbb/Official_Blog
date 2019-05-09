class Setting < ApplicationRecord

	# define the name of the site regarding the moderator name
	def self.site_name
		Setting.first.try(:site_name)
	end

	# Define a number of post per page
	def self.post_per_page
		Setting.first.try(:post_per_page)
	end

	# ability to show tags dependent on the settings
	def self.tag_visible?
		Setting.first.try(:tag_visibility)
	end
end
