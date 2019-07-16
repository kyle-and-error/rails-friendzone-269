class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hosted_events, class_name: "Event"

  def full_name
    "#{first_name} #{last_name}" if first_name && last_name
  end
end
