class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :people_needed
      t.date :date
      t.string :photo

      t.timestamps
    end
    add_reference :events, :host, foreign_key: { to_table: :users }
  end
end
