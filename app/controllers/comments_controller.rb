class CommentsController < ApplicationController
  def create
  	visitor = Visitor.find_by(email: visitor_comments_params[:email])

  	# Si le visiteur existe, on crée un nouveau commentaire avec le message et post_id
  	# ensuite on l'enrégistre dans le tableau des commentaires de ce visiteur.
  	if visitor
  		visitor.tap do |v| 
  			v.comments << Comment.new(visitor_comments_params[:comments_attributes]['0'])
  		end
  	else
  		visitor = Visitor.new(visitor_comments_params)
  		
  	end

  	if visitor.save
  		flash[:notice] = " Successfully created new comment"
  	else
  		flash[:alert] = 'There was a problem creating a new comment'
  		set_visitor_sessions
  	end
  	redirect_to posts_path()
  end

  private

  def visitor_comments_params
  	params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end

  def visitor
  	# we don't insert in the data base if there are errors
  	@visitor ||= VisitorCommentService.new(visitor_comments_params).visitor
  end
  
  def set_visitor_sessions
  	session[:visitor_errors] = visitor.errors.full_messages
  end

end
