class ChangeDeparturetoDatetime < ActiveRecord::Migration[7.0]
  def change
      change_column(:travelers, :departure_flight_time, :datetime)
  end
end
