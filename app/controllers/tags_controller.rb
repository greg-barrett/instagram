class TagsController < ApplicationController
  def show
    @taggings=Tagging.where(tag_id: params[:id])
  end
end
