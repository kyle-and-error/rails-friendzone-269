class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @events = Event.all

    policy_scope(Event)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end
end
