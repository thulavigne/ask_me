class ResponsesController < ApplicationController
before_filter :find_discussion
before_filter :find_response, :only => [:show, :edit, :update, :destroy]

  def new
    @response = @discussion.responses.build
  end

  def create
    @response = @discussion.responses.build(params[:response])
    if @response.save
      flash[:notice] = "Answer has been submitted."
      redirect_to [@discussion, @response]
    else
      flash[:alert] = "Answer has not been submitted."
      render :action => "new"
    end
  end

  def show
  end

  private
    def find_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def find_response
      @response = @discussion.responses.find(params[:id])
    end
end
