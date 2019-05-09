class CommentsController < ApplicationController
  def create
  	@visitor = Visitor.new(visitor_comments_params)
  	@visitor.save

  	redirect_to posts_path()
  end

  private

  def visitor_comments_params
  	params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end
end
