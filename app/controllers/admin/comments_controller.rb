class Admin::CommentsController <Admin::ApplicationController

  def index
  	@comments = Comment.where(status: ActiveModel::Type::Boolean.new.cast(params[:status]))
  end

  def update
  end

  def destroy
  end
end
