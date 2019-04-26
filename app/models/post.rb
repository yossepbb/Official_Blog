class Post < ApplicationRecord
  belongs_to :moderator
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :title, presence: true
  validates :content, presence: true
  
  # self bc it belongs to post's model
  def self.matching_title_or_content(search)

  	where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

end
