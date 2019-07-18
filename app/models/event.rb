class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :potential_attendees, dependent: :destroy
  has_many :users, through: :potential_attendees
  geocoded_by :address

  validates :host, :name, :people_needed, :address, :start_time, :end_time, presence: true
  validates_numericality_of :people_needed, greater_than: 0
  after_validation :geocode, if: :will_save_change_to_address?

  def attendees
    potential_attendees.select { |potential_attendee| potential_attendee.status == "accepted" }
  end
end
