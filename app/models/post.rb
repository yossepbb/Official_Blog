class Post < ApplicationRecord

  belongs_to :moderator
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :title, presence: true
  validates :content, presence: true

  
  # self bc it belongs to post's model
  # Method a find a post filter by name and content
  def self.matching_title_or_content(search)

  	where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.filter_by_tags(params_tag)
    includes(:tags).where(publish: true, tags: {name: params_tag}).order(id: :desc)
  end

end
