class Admin::CommentsController <Admin::ApplicationController

  def index
  	@comments = Comment.all
  end

  def update
  end

  def destroy
  end
end
