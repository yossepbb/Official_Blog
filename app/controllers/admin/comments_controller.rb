class Admin::CommentsController <Admin::ApplicationController

  def index
  	# Rechercher un commentaire a partir d'un mot clé.
  	if params[:search].present?
  		@comments = Comment.matching_fullname_or_message(params[:search]).page(params[:page]).per(5)
  	else
  	 @comments = Comment.where(status: to_bool(params[:status])).page(params[:page]).per(5)
  	end

  end

  def update
  	@comment = Comment.find(params[:id])

  	# Update a comment status
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
