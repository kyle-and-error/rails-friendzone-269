class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :potential_attendees, dependent: :destroy
  has_many :users, through: :potential_attendees

  validates :host, :name, :people_needed, :location, presence: true
  validates_numericality_of :people_needed, greater_than: 0

  def attendees
    users.select { |user| user.status == "accepted" }
  end
end
