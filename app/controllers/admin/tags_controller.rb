class Admin::TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    tag_params[:name].split(',').map do | n|

        Tag.new(name: n).save
        
    end

    redirect_to new_admin_tag_path, notice: "Tag was successful ceated"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end
