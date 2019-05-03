class Admin::MessagesController < Admin::ApplicationController
  def index
 	if params[:search].present?

 		@messages = Message.matching_fullname_or_content(params[:search]).page(params[:page]).per(5)

 	else
  		@messages = Message.all.order(:desc).page(params[:page]).per(5)
 	end

  end

  def show
  	@message = Message.find(params[:id])
  end

  def update
  	@message = Message.find(params[:id])

  	@message.update(status: params[:status])

  	redirect_to admin_messages_path, notice: 'Successfully updated message'
  end

  def destroy

  	@messages = Message.find(params[:id])
  	@messages.destroy

  	redirect_to admin_messages_path, notice: 'Message was Successfully deleted'

  end


end
