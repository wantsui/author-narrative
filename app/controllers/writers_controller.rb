class WritersController < ApplicationController
  skip_before_action :authenticate_writer!, only: [:index], raise: false
  def index
    @total_stories = Story.count
    @total_writers = Writer.count
    @writer = Writer.first
    @public_private_stories_pie = { 'Public Stories': Story.where(share_work: true).count, 'Private Stories': Story.where(share_work: false).count}
    render :index
  end

  def show
    @writer = Writer.find_by(id: params[:id])
    if @writer == current_writer
      @daily_stories_chart = @writer.stories.group_by_day(:created_at).count
    elsif @writer
      @daily_stories_chart = @writer.custom_created_date_json_to_date
      @stories_by_word_count_chart = @writer.custom_stories_by_word_count_json
    end
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

  def edit
    @writer = current_writer
    if @writer
      render :edit
    else
      render plain: 'Error'
    end
  end

  def update
    @writer = Writer.find_by(id: params[:id])
    if (@writer == current_writer) && @writer.update(writer_params)
      redirect_to "/writers/#{current_writer.id}"
    else
      render plain: 'Error'
    end
  end
  private
  def writer_params
    params.require(:writer).permit(:bio, :username)
  end
end
