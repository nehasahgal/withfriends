class CreateTravelers < ActiveRecord::Migration[7.0]
  def change
    create_table :travelers do |t|
      t.integer :user_id
      t.integer :trip_id
      t.datetime :arrival_flight_time
      t.string :departure_flight_time
      t.string :comments

      t.timestamps
    end
  end
end
