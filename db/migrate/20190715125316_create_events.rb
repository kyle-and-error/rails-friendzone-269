class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :people_needed
      t.date :date
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
