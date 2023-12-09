class AddAirlinetoTraveler < ActiveRecord::Migration[7.0]
  def change
    add_column(:travelers, :arrival_airline, :string)
    add_column(:travelers, :departure_airline, :string)
    add_column(:travelers, :arrival_flight_number, :string)
    add_column(:travelers, :departure_flight_number, :string)
  end
end
