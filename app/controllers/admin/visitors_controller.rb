class Admin::VisitorsController < Admin::ApplicationController

  def index
  	@visitors = Visitor.all.order(:desc).page(params[:page]).per(5)
  end

  def destroy
  	@visitor = Visitor.find(params[:id])
  	@visitor.destroy
  	redirect_to admin_visitors_path, notice: 'Successfully deleted visitor'
  end
end
