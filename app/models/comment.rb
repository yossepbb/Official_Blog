class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :visitor
  has_many :notifications, as: :notifiable, dependent: :destroy

  # method pour rechercher un commentaire a partir d'un nom ou mot clé
  def self.matching_fullname_or_message(params)
  	joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params}%", "%#{params}%")
  end
end
