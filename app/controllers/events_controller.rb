class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    search = params[:search]
    if search.present?
      query = search[:query]
      if query.present?
        @events = Event.find_by_name_and_description(query)
      else
        @events = Event.all
      end

      search_start = search[:start_date]
      search_end = search[:end_date]
      search_group = search[:group_size]
      search_category = search[:category]
      if search_start.present? && search_end.present?
        @events = Event.find_events_in_range(@events, search_start, search_end)
      end

      @events = Event.find_by_group_size(search_group) if search_group.present?

      @events = Event.find_by_category(search_category) if search_category.present?
    else
      @events = Event.all
    end

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end

    policy_scope(Event)
  end

  def show
    @event = Event.find(params[:id])
    @markers = [{
        lat: @event.latitude,
        lng: @event.longitude
      }]
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    authorize @event
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :description, :location, :people_needed, :photo, :start_time, :end_time)
  end
end
