class PostsController < ApplicationController
	
  def index
  	@posts = Post.where(publish: true).order(id: :desc).page(params[:page])
  end

  def show
  end
end
