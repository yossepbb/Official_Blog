module ApplicationHelper
	# helper is helpull to remove repetiton and to speed things up
	def status_converter(status, truthy: "Active", falsey: "pending")
		if status
			truthy
		else
			falsey
		end
	end

	 def time_ago(time)
    	"#{time_ago_in_words(time)} ago"
  	end
end
