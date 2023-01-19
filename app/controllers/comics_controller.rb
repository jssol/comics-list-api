class ComicsController < ApplicationController
  before_action :set_comic, only: %i[update]

  # GET /comics
  def index
    url = get_url('/comics')
    response = RestClient.get(url, { content_type: :json, accept: :json })

    @comics = JSON.parse(response.body)['data']['results']

    if @comics
      render json: @comics
    else
      render json: { error: 'Not found' }, status: :error
    end
  end

  # GET /comics/:id
  def show
    url = get_url("/comics/#{params[:id]}")
    response = RestClient.get(url, { content_type: :json, accept: :json })

    @comic = JSON.parse(response.body)['data']['results'][0]

    if @comic
      render json: @comic
    else
      render json: { error: 'Not found' }, status: :error
    end
  end

  # PATCH/PUT /comics/:id
  def update
    if @comic.update(comic_params)
      render json: @comic
    else
      render json: @comic.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comic
    @comic = Comic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comic_params
    params.require(:comic).permit(:id, :title, :description, :thumbnail, :favorite)
  end
end
