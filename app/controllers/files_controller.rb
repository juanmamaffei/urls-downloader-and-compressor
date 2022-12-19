class FilesController < ApplicationController
  def run
    service = EnqueueCompression.new(params[:urls]).run
    render json: service
  end
end
