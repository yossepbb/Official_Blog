class Post < ApplicationRecord
  belongs_to :moderator
  has_many :comments
  has_many :tags, through: :post_tags

  # self bc it belongs to post's model
  def self.matching_title_or_content(search)

  	where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

end
