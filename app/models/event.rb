class Event < ApplicationRecord
  belongs_to :category
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

  def self.find_by_name_and_description(query)
    sql_query = "name ILIKE :query OR description ILIKE :query"
    where(sql_query, query: "%#{query}%")
  end

  def self.find_events_in_range(events, search_start, search_end)
    range = search_start..search_end
    events.select { |event| range.cover?(event.start_time) }
  end

  def self.find_by_group_size(events, group_size)
    events.select { |event| event.group_size >= group_size}
  end

  def self.find_by_category(events, category)
    events.select { |event| event.category == category}
  end
end
