class StoriesController < ApplicationController
  skip_before_action :authenticate_writer!, only: [:show], raise: false
  def new
    @story = Story.new
    render :new
  end

  def create
    if current_writer && current_writer.stories.create(story_params)
      redirect_to "/writers/#{current_writer.id}"
    else
      @story = Story.new(story_params)
      render :new
    end
  end

  def show
    @story = Story.find_by(id: params[:id])
    if @story && (@story.share_work || (@story.writer == current_writer))
      render :show
    else
      render plain: 'Error'
    end
  end

  def edit
    @story = Story.find_by(id: params[:id])
    if @story && (@story.writer == current_writer)
      render :edit
    else
      render plain: 'Error'
    end
  end

  def update
    @story = Story.find_by(id: params[:id])
    if @story && (@story.writer == current_writer) && @story.update(story_params)
      redirect_to "/writers/#{current_writer.id}/stories/#{@story.id}"
    else
      render plain: 'Error'
    end
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    if @story && (current_writer == @story.writer)
      @story.destroy
      redirect_to "/writers/#{current_writer.id}"
    else
      redirect_to "/writers"
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :description, :share_work)
  end
end
