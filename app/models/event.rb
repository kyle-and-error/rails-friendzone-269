class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :potential_attendees
  has_many :users, through: :potential_attendees

  validates :host, :name, :photo, :people_needed, :location, :start_time, :end_time, presence: true
  validates_numericality_of :people_needed, greater_than: 0
end
