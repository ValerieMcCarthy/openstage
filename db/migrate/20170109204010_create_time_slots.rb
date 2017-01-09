class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.integer :venue_id
      t.integer :performer_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :age_restriction, default: "All Ages"
      t.string :status, default: "Available"

      t.timestamps
    end
  end
end
