class Admin::TagsController < ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc).page(params[:page]).per(10)
  end

  def create
    tag_params[:name].split(',').map do | n|
        Tag.new(name: n).save    
    end

    redirect_to new_admin_tag_path, notice: "Tag was successful ceated"
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to new_admin_tag_path, notice: 'successfully updated'
    else
      flash[:alert]= "There was a problem updating tag"
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to new_admin_tag_path, notice: 'Tag was successfully deleted'
  end

  private

  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end
