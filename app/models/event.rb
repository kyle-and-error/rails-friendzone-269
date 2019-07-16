class Event < ApplicationRecord
  belongs_to :user
  has_many :potential_attendees
  has_many :users, through: :potential_attendees

  # validates :user, :name, :photo, :people_needed, :location, :start_time, :end_time, presence: true
  # validates_numericality_of :people_needed, greater_than: 0
end
