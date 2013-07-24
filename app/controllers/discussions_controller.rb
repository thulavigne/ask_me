class DiscussionsController < ApplicationController

  def index
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(params[:discussion])
    if @discussion.save
      flash[:notice] = "Discussion has been created."
      redirect_to @discussion
    else
      # nothing, yet
    end
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

end