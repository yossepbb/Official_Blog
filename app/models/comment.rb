class Comment < ApplicationRecord
  belongs_to :post, required: false
  belongs_to :visitor, required: false
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :message, presence: true

  # permet de specifier les valeurs de variables que voudrait voir ou manipuler
  scope :approved, -> {where status: true }

  # method pour rechercher un commentaire a partir d'un nom ou mot clé
  def self.matching_fullname_or_message(params)
  	joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params}%", "%#{params}%")
  end

  include Notifiable
end
