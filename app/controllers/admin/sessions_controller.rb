class Admin::SessionsController < Admin::ApplicationController
  
  before_action :authorize, except:[:new, :create]
  def new
  end

  def create
  	@moderator = Moderator.find_by(username: params[:username]).try(:authenticate, params[:password])

  		if @moderator
  			session[:current_moderator_id] = @moderator.id
  			redirect_to admin_moderators_path, notice: 'You have successfull signed in'
  		else
  			flash[:alert] = 'There is a problem with your username or password'
  			render 'new'
  		end
  end

  def destroy
  	session[:current_moderator_id] = nil
  	redirect_to '/login', notice: 'You have successfull log out'
  end
end
