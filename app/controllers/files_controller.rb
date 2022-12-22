class FilesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def run
    return render(json: {message: 'Faltan parámetros'}, status: :bad_request) unless params[:urls]
    service = EnqueueCompression.new(params[:urls]).run
    render json: service
  end
end
