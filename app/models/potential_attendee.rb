class PotentialAttendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :status, presence: true
  enum status: %i[pending accepted rejected]
end

