class PotentialAttendeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_potential_attendees, only: %i[show destroy]

  def index
    @event = Event.find(params[:event_id])
    @potential_attendees = Potential_Attendee.all.select { |event| event == @event }
    policy_scope Potential_Attendee
  end

  def new
    @potential_attendee = Potential_Attendee.new
  end

  def create
  end

  def show
    # displays status of request
  end

  def destroy
    # only potential_attendee can do this
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_potential_attendees
    @potential_attendee = Event.find(params[:id])
    authorize @potential_attendee
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    # params.require(:event).permit(:name, :user_id)
  end
end
