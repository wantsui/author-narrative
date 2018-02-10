class StoriesController < ApplicationController
  skip_before_action :authenticate_writer!, only: [:show], raise: false
  def new
    @story = Story.new
    render :new
  end

  def create
    if current_writer.stories.create(story_params)
      redirect_to "/writers/#{current_writer.id}"
    else
      render :new
    end
  end

  def show
    @story = Story.find_by(id: params[:id])
    if @story && (current_writer == @story.writer || @story.share_work)
      render :show
    else
      render plain: 'Error'
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :description, :share_work)
  end
end
