class Category < ApplicationRecord
  has_many :events

  def self.options_for_select
    Category.order(category_name: :asc).map { |c| [c.category_name.capitalize, c.id] }
  end
end
