class DiscussionsController < ApplicationController

  def index
    @discussions = Discussion.all
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
      flash[:notice] = "Discussion has not been created."
      render :action => "new"
    end
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    @discussion = Discussion.find(params[:id])
    if @discussion.update_attributes(params[:discussion])
      flash[:notice] = "Discussion has been updated."
      redirect_to @discussion
    else
      flash[:alert] = "Discussion has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    flash[:notice] = "Discussion has been deleted."
    redirect_to discussions_path
  end

end
