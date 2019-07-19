class AddCategoryToEvents < ActiveRecord::Migration[5.2]
  def change
        add_reference :events, :category, foreign_key: { to_table: :categories }
  end
end
