class Event < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :user, :name, :photo, :people_needed, :location, presence: true
  vaildates :people_needed, greater_than_or_equal_to: 0
end
