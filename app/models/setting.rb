class Setting < ApplicationRecord

	def self.site_name
		Setting.first.site_name
	end
end
