class Admin::CommentsController <Admin::ApplicationController

  def index
  	if params[:search].present?
  		@comments = Comment.joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  	else
  	@comments = Comment.where(status: to_bool(params[:status]))
  	end

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
