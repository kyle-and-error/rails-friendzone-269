class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hosted_events, class_name: "Event", foreign_key: :host_id, dependent: :destroy
  has_many :potential_attendees, dependent: :destroy

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end
end
