class Tag < ApplicationRecord
	has_many :posts, through: :post_tags
	validates :name, presence: true

	# methode qui permet de verfier si un tag est deja existant et le conserver
	def in_use?
		PostTag.exists?(tag_id: self.id)
	end
end
