class Message < ApplicationRecord
  belongs_to :visitor

  validates :content, presence: true

  # method pour rechercher un message a partir d'un nom ou mot clé
  def self.matching_fullname_or_content(params)

  	joins(:visitor).where("fullname LIKE ? OR content LIKE ?", "%#{params}%", "%#{params}%")
  end

  def mark_read
  		update(status: true) if status == false
  end
end
