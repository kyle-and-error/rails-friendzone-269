class PotentialAttendeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_potential_attendee, only: %i[show destroy update]
  before_action :set_event, only: %i[new create index]

  def index
    @potential_attendees = PotentialAttendee.all.select { |attendee| attendee.event == @event }
    policy_scope PotentialAttendee
  end

  def new
    @potential_attendee = PotentialAttendee.new
    authorize @potential_attendee
  end

  def create
    @potential_attendee = PotentialAttendee.new(potential_attendee_params)
    @potential_attendee.user = current_user
    @potential_attendee.event = @event

    respond_to do |format|
      if @potential_attendee.save
        format.html { redirect_to @event, notice: 'Potential Attendee was successfully created.' }
        format.json { render :show, status: :created, location: @potential_attendee }
      else
        format.html { render :new }
        format.json { render json: @potential_attendee.errors, status: :unprocessable_entity }
      end
    end
    authorize @potential_attendee
  end

  def update
    @potential_attendee.update(status: params[:status])

    redirect_to event_potential_attendees_path(@potential_attendee.event)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_potential_attendee
    @potential_attendee = PotentialAttendee.find(params[:id])
    authorize @potential_attendee
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def potential_attendee_params
    params.require(:potential_attendee).permit(:initial_message)
  end
end
