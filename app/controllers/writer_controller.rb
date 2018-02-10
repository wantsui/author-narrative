class WriterController < ApplicationController
  def index
    render plain: writer_signed_in?
  end
end
