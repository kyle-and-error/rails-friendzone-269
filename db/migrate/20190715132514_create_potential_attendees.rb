class CreatePotentialAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_attendees do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key:true
      t.column :status, :integer, default: 0
      t.text :initial_message

      t.timestamps
    end
  end
end
