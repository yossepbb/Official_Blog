class Message < ApplicationRecord
  belongs_to :visitor

  def self.matching_fullname_or_content(params)

  	joins(:visitor).where("fullname LIKE ? OR content LIKE ?", "%#{params}%", "%#{params}%")
  end
end
