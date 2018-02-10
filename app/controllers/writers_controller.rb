class WritersController < ApplicationController
  skip_before_action :authenticate_writer!, only: [:index], raise: false
  def index
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
