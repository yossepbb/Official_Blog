class Admin::CommentsController <Admin::ApplicationController

  def index
  	@comments = Comment.where(status: to_bool(params[:status]))
  end

  def update
  	@comment = Comment.find(params[:id])

  	if @comment.update(status: params[:status])
  		@comment.save
  		redirect_to admin_comments_path, notice: "Successfully updated comment"
  	else
  		redirect_to admin_comments_path, notice: "There was a problem updating comment"
  	end

  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to admin_comments_path, notice: "Successfully deleted comment"
  end
end
