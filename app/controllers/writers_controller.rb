class WritersController < ApplicationController
  skip_before_action :authenticate_writer!, only: [:index], raise: false
  def index
    @total_stories = Story.count
    @writer = Writer.first
    @public_private_stories_pie = { 'Public Stories': Story.where(share_work: true).count, 'Private Stories': Story.where(share_work: false).count}
    render :index
  end

  def show
    @writer = Writer.find_by(id: params[:id])
    if @writer == current_writer
      @stories = @writer.stories
      render :show
    elsif @writer
      @stories = @writer.stories.where(share_work: true)
      render :show
    else
      render plain: 'Error'
    end
  end
end
