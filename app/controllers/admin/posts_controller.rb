class Admin::PostsController < Admin::ApplicationController

  def index
    # affichage des posts par ordre desc
    @posts = Post.all.order(id: :desc)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
