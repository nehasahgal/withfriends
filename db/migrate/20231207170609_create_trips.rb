class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :destination
      t.integer :travelers_count

      t.timestamps
    end
  end
end
