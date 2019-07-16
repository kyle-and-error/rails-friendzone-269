class Event < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :user, :name, :photo, :people_needed, :location, :start_time, :end_time, presence: true
  validates_numericality_of :people_needed, greater_than: 0
end