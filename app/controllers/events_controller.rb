class EventsController < ApplicationController
  before_action :set_event, only: %i[update]

  # GET /events
  def index
    url = get_url('/events')
    response = RestClient.get(url, { content_type: :json, accept: :json })

    @events = JSON.parse(response.body)['data']['results']

    if @events
      render json: @events
    else
      render json: { error: 'Not found' }, status: :error
    end
  end

  # GET /events/:id
  def show
    url = get_url("/events/#{params[:id]}")
    response = RestClient.get(url, { content_type: :json, accept: :json })

    @event = JSON.parse(response.body)['data']['results'][0]

    if @event
      render json: @event
    else
      render json: { error: 'Not found' }, status: :error
    end
  end

  # PATCH/PUT /events/:id
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:id, :title, :description, :thumbnail, :favorite)
  end
end
