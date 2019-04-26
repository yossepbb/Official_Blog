class Admin::PostsController < Admin::ApplicationController

  def index
    # affichage des posts par ordre desc
    # requete pour rechercher dans la base de données un post avec le titre ou le contenu correspondant aux params[:search]
    if params[:search].present?
      @posts = Post.matching_title_or_content(params[:search]).page(params[:page]).per(10)
    else
      @posts = Post.all.order(id: :desc).page(params[:page]).per(10)
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create()
  end

  def edit
  end

  def update
  end

  def show
    @post =Post.find(params[:id])
  end

  def destroy
  end

  private


end
